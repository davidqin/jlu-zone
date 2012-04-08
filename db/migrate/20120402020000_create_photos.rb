class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos, :force => true do |t|
      t.string  :img_url,  :null => false
      t.integer :album_id, :null => false
      t.boolean :upload,   :null => false, :default => false
      t.timestamps
    end
    add_index :photos, [:album_id]
  end

  def self.down
    drop_table :photos
  end
end