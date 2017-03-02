module ReviewsHelper
	def review_owner(review)
		review.user_id == current_user.id ? true : false
	end
end
