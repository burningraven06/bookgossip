class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :heading
      t.string :review
      t.references :book
      t.string :status
      t.date :publication_date
      t.boolean :default_avatar
      t.timestamps
      t.references :user
    end
  end

end
