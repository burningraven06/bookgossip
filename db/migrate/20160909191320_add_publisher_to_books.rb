class AddPublisherToBooks < ActiveRecord::Migration[5.0]
  def change
  	add_index :books, :publisher_id
  	# add_index :books, :id
  end
end
