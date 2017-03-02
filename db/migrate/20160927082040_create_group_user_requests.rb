class CreateGroupUserRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :group_user_requests do |t|
      t.references :user
      t.references :group
      t.boolean :request_approved

      t.timestamps
    end
  end
end
