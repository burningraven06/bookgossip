class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper, GroupsHelper, UsersHelper, TopicsHelper, AuthorsHelper, BooksHelper, PublishersHelper, GenresHelper
	def home
	end
end
