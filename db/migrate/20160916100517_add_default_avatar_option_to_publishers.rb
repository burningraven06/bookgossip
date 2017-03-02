class AddDefaultAvatarOptionToPublishers < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :default_avatar, :boolean
  end
end
