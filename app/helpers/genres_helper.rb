module GenresHelper
	def genre_owner(genre)
		genre.user_id == current_user.id ? true : false
	end
end
