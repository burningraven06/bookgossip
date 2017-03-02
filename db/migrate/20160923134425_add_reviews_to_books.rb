class AddReviewsToBooks < ActiveRecord::Migration[5.0]
	def change
		create_table :books_reviews do |t|
			t.references :book
			t.references :review
		end
	end
end
