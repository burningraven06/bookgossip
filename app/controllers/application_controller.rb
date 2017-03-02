class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper, GroupsHelper, UsersHelper, TopicsHelper
	def home
	end
end
