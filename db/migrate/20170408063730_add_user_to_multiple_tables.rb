class AddUserToMultipleTables < ActiveRecord::Migration[5.0]
	def self.up
		change_table :books do |t|
			t.references :user
		end
		change_table :authors do |t|
			t.references :user
		end
		change_table :publishers do |t|
			t.references :user
		end
		change_table :genres do |t|
			t.references :user
		end

	end
end
