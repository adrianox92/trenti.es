class AddAttachmentImageToBanneres < ActiveRecord::Migration
  def self.up
    change_table :banneres do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :banneres, :image
  end
end
