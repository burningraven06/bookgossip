class AddEmailConfirmColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_confirmed, :boolean
    add_column :users, :account_confirmation_token, :string
  end
end
