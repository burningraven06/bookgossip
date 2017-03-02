class AddDefaultAvatarOptionToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :default_avatar, :boolean
  end
end
