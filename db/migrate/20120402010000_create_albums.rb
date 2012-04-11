class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums, :force => true do |t|
      t.string  :name, :null => false
      t.string  :description, :null => false
      t.integer :fonder_id,    :null => false
      t.timestamps
    end
    add_index :albums, [:fonder_id]
  end

  def self.down
    drop_table :albums
  end
end
