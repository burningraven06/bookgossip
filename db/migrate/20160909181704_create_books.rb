class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :publication_date
      t.string :cover_page
      t.string :book_summary
      t.references :author
      t.references :publisher
      
      t.timestamps
    end
  end
end
