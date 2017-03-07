class ExtrapagesController < ApplicationController
	def about
	end
	def root_home_page
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
