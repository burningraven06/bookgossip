class BooksGenres < ActiveRecord::Migration[5.0]
	def change
		create_table :books_genres do |t|
			t.references :book
			t.references :genre
		end
	end
end
