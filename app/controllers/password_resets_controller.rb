class PasswordResetsController < ApplicationController
	def new
		respond_to do |format|
			format.html {}
			format.json {}
			format.js
		end
	end

	def create
		@user=User.find_by_email(params[:email])
		if @user
			@user.send_password_reset
			@mail_sent=true
			flash[:info]="An Email has been sent to you with password reset instructions."
			respond_to do |format|
				format.html {redirect_to common_signup_path}
				format.json{}
				format.js
			end
		else
			@invalid_email=true
			respond_to do |format|
				format.html {flash[:danger]="Email not registered!";render 'new'}
				format.json{}
				format.js
			end
		end
	end

	def edit
		@user=User.find_by_password_reset_token!(params[:id])
	end

	def update
		@user=User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_sent_at < 2.hours.ago
			flash[:danger]="Sorry, the Password Reset Request has expired. Please try again."
			redirect_to new_password_reset_path
		elsif @user.update(password_reset_params)
			flash[:success]="Your password has been reset! Log in with your new password."
			redirect_to common_signup_path
		else
			render :edit
		end
	end

	private 
	def password_reset_params
		params.require(:user).permit(:password, :password_confirmation)
	end

end
