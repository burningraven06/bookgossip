class ChangeDateFormatInUsers < ActiveRecord::Migration[5.0]
	def change
		def up
			change_column :users, :date_of_birth, :date
		end

		def down
			change_column :users, :date_of_birth, :string
		end
	end
end
