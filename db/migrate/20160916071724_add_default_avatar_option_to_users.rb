class AddDefaultAvatarOptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :default_avatar, :boolean
  end
end
