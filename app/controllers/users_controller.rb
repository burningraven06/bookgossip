class UsersController < ApplicationController
	respond_to :json

	def new
		@user = User.new
	end
	
	def show
		@user=User.find(params[:id])
		@reviews_of_user = @user.reviews.order(heading: :asc).paginate(page: params[:review_page], per_page: 12)
		@groups_of_user = Group.where("user_id = ?", current_user.id).order(name: :asc).paginate(page: params[:group_page], per_page: 12)
	end
	
	def create
		@user=User.new(user_params)
		respond_to do |format|
			if @user.save
				# cookies[:remember_token] = @user.remember_token
				# UserMailer.account_activation(@user).deliver
				@user.activate_account
				format.js{}
				# format.html{	redirect_to common_signup_path ; flash[:info] = "Hey #{@user.name}, An Email has been sent to you for account activation." }
				format.html{	redirect_to common_signup_path ; flash[:info] = "Hey #{@user.name}, Your account has been created. Sign in with your email & password." }
			else
				format.html { render 'new' }
				format.js{}
			end
		end
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(current_user.id)
		@set_def_avt=params[:user][:default_avatar]
		@user.avatar.destroy if @set_def_avt
		respond_to do |format|
			if @user.update(user_profile_params)
				format.html {	redirect_to @user; flash[:success] = "#{@user.name}, your profile got updated."	}
				format.js {}
			else
				format.html { render 'edit'	}
				format.js {}
			end
		end
	end

	def update_password
		@user=User.find(current_user.id)
		current_password=params[:user][:current_password]
		@correct_password= @user && @user.authenticate(current_password)
		respond_to do |format|
			if @correct_password
				if @user.update(user_password_params)
					format.html {redirect_to common_signup_path; flash[:success] = "#{@user.name}, your profile got updated. Log in with your new Password."	}
					format.js {}
				else
					format.html {render 'edit'}
					format.js {}
				end
			else
				@correct_password = false
				format.html {render 'edit'}
				format.js {}
			end
		end
	end

	def account_confirmation
		@user=User.find_by_account_confirmation_token(params[:id])
		respond_to do |format|
			if @user
				@user.activate_account
				format.js {}
				format.html { redirect_to common_signup_path ; flash[:success]="Congratulations #{@user.name}, your account has been activated. Sign in with your username/password."}
			else
				format.html { redirect_to common_signup_path ; flash[:danger]="Sorry, the account does not exist. Please try registering with a different email address."}
				format.js {}
			end
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :account_type)
	end

	def user_profile_params
		params.require(:user).permit(:name, :email, :gender, :date_of_birth, :avatar, :show_birthday_status)
	end

	def user_password_params
		params.require(:user).permit(:password, :password_confirmation)
	end

end
