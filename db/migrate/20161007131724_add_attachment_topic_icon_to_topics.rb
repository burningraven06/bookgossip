class AddAttachmentTopicIconToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.attachment :topic_icon
    end
  end

  def self.down
    remove_attachment :topics, :topic_icon
  end
end
