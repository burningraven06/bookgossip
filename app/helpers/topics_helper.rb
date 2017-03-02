module TopicsHelper
	def topic_owner(topic_id)
		@topic = Topic.find_by_id(topic_id)
		@topic.user_id == current_user.id ? true : false
	end
end
