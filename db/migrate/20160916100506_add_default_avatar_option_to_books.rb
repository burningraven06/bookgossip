class AddDefaultAvatarOptionToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :default_avatar, :boolean
  end
end
