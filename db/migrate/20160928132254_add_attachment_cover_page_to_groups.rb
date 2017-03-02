class AddAttachmentCoverPageToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :cover_page
    end
  end

  def self.down
    remove_attachment :groups, :cover_page
  end
end
