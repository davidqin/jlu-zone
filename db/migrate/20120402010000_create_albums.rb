class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums, :force => true do |t|
      t.string  :description, :null => false
      t.integer :user_id,    :null => false
      t.timestamps
    end
    add_index :albums, [:user_id]
  end

  def self.down
    drop_table :albums
  end
end