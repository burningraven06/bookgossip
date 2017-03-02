class SessionsController < ApplicationController
	respond_to :json
	# def new
	# end

	def create
		@user=User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			if @user.account_confirmed
				if params[:remember_me]
					cookies.permanent[:remember_token] = @user.remember_token
				else
					cookies[:remember_token] = @user.remember_token
				end
				flash[:success] = "Welcome Back, #{@user.name}"
				redirect_to bookgosp_home_path
			else
				@email_unconfirmed=true
				respond_to do |format|
					format.html{
						flash[:warning]="Please activate your account first!"
						redirect_to common_signup_path
					}
					format.js {}
				end
			end
		else
			@invalid_email_password=true
			respond_to do |format|
				format.html{
					flash[:danger]="Oops! Invalid Email/Password Combination"
					redirect_to common_signup_path 
				}
				format.js {}
			end
		end
	end

	def destroy
		cookies.delete(:remember_token)
		redirect_to common_signup_path
	end
end
