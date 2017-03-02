class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :heading
      t.string :body
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.boolean :default_avatar
      t.integer :reply_count
      t.timestamps
    end
  end
end
