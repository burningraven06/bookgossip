class AddDefaultCoverPageToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :default_avatar, :boolean
  end
end
