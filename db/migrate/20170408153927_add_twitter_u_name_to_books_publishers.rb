class AddTwitterUNameToBooksPublishers < ActiveRecord::Migration[5.0]
	def change
		add_column :books, :twitter_username, :string
		add_column :publishers, :twitter_username, :string
	end
end
