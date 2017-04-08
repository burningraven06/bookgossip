module PublishersHelper
	def publisher_owner(publisher)
		publisher.user_id == current_user.id ? true : false
	end
end
