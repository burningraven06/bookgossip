class AddAuthorIgUserNameToAuthors < ActiveRecord::Migration[5.0]
  def change
  	add_column :authors, :twitter_username, :string
  end
end
