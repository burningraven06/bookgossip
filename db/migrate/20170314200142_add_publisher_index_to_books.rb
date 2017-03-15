class AddPublisherIndexToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publisher_id, :string
    add_index :books, :publisher_id
  end
end
