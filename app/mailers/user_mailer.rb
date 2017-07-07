class UserMailer < ApplicationMailer
	default from: 'BookGossip.Mailman@suchwow.com'

	def account_activation(user)
		@user=user
		mail(to: @user.email, subject: "BookGossip Account Activation")
	end

	def password_reset(user)
		@user=user
		mail(to: @user.email, subject: "BookGossipp Password Reset")
	end
end
