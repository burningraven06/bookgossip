class CreateTopicReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_replies do |t|
      t.references :topic
      t.references :user
      t.string :content
      t.timestamps
    end
  end
end
