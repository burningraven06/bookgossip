class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.references :user
      t.string :name
      t.string :description
      t.integer :member_count
      t.integer :post_count

      t.timestamps
    end
  end
end
