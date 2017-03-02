class AddUserInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :string, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :gender, :string
    add_column :users, :account_type, :string
  end
end
