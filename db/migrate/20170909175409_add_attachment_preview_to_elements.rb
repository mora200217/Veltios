class AddAttachmentPreviewToElements < ActiveRecord::Migration[5.1]
  def self.up
    change_table :elements do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :elements, :preview
  end
end
