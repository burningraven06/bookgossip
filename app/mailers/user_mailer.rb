class UserMailer < ApplicationMailer
	default from: 'SayMyName@suchwow.com'

	def account_activation(user)
		@user=user
		mail(to: @user.email, subject: "BookGosp Account Activation")
	end

	def password_reset(user)
		@user=user
		mail(to: @user.email, subject: "BookGosp Password Reset")
	end
end
