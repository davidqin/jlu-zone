class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos, :force => true do |t|
      t.string  :description, :null => false
      t.integer :user_id,    :null => false
      t.timestamps
    end
    add_index :photos, [:user_id]
  end

  def self.down
    drop_table :photos
  end
end