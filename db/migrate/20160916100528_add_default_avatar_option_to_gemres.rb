class AddDefaultAvatarOptionToGemres < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :default_avatar, :boolean
  end
end
