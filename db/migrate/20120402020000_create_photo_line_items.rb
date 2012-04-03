class CreatePhotoLineItems < ActiveRecord::Migration
  def self.up
    create_table :photo_line_items, :force => true do |t|
      t.string  :img_url,  :null => false
      t.integer :photo_id, :null => false
      t.timestamps
    end
    add_index :photo_line_items, [:photo_id]
  end

  def self.down
    drop_table :photo_line_items
  end
end