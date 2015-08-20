class AddAttachmentImageToUploades < ActiveRecord::Migration
  def self.up
    change_table :uploades do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :uploades, :image
  end
end
