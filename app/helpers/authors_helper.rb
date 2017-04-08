module AuthorsHelper
	def author_owner(author)
		author.user_id == current_user.id ? true : false
	end
end
