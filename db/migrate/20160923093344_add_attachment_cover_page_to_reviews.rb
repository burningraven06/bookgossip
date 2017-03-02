class AddAttachmentCoverPageToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :cover_page
    end
  end

  def self.down
    remove_attachment :reviews, :cover_page
  end
end
