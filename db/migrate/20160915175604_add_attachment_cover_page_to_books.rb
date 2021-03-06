class AddAttachmentCoverPageToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :cover_page
    end
  end

  def self.down
    remove_attachment :books, :cover_page
  end
end
