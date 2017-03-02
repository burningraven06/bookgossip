class AddAttachmentCoverPageToPublishers < ActiveRecord::Migration
  def self.up
    change_table :publishers do |t|
      t.attachment :cover_page
    end
  end

  def self.down
    remove_attachment :publishers, :cover_page
  end
end
