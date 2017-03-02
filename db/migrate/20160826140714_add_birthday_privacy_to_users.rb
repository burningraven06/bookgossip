class AddBirthdayPrivacyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :show_birthday_status, :string
  end
end
