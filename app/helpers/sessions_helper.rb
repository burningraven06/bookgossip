module SessionsHelper
	def current_user
		if User.count >0
			@current_user ||= User.find_by_remember_token!(cookies[:remember_token]) rescue nil
		end
	end
	def require_login
		redirect_to common_signup_path unless current_user
	end
end
