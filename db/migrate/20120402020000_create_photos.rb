class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos, :force => true do |t|
      t.string  :img_url,  :null => false
      t.integer :album_id
      t.text    :description
      t.boolean :lock,     :null => false, :default => false
      t.integer :fonder_id,   :null => false
      t.timestamps
    end
    add_index :photos, [:album_id]
  end

  def self.down
    drop_table :photos
  end
end