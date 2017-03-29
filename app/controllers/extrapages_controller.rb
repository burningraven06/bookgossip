class ExtrapagesController < ApplicationController
	require 'will_paginate/array'

	def about
	end
	def root_home_page
		@tweets = $twitter_client.user_timeline("StephenKing")
		@tweets = @tweets.paginate(page: params[:page], per_page: 12)
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
