class ExtrapagesController < ApplicationController
	before_action :require_login
	require 'will_paginate/array'

	def about
	end
	
	def root_home_page
		@authors_of_logged_user = Author.where("user_id = ?", current_user.id)
		@books_of_logged_user = Book.where("user_id = ?", current_user.id)
		@publishers_of_logged_user = Publisher.where("user_id = ?", current_user.id)

		@nothing_exists =true
		if @authors_of_logged_user or @books_of_logged_user or @publishers_of_logged_user
			@nothing_exists = false
		end

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @tweets}
			format.js
		end 
	end

	def gallery
	end

	def calendar
		@reviews=Review.all
		@books=Book.all
		@authors = Author.all
		@users= User.all
	end
end
