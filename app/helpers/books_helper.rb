module BooksHelper
	def book_owner(book)
		book.user_id == current_user.id ? true : false
	end
end
