class CreatePublishers < ActiveRecord::Migration[5.0]
	def change
		create_table :publishers do |t|
			t.string :name
			t.string :address
			t.string :website
			t.string :cover_page

			t.timestamps
		end
	end
end
