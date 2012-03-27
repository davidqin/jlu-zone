class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags, :force => true do |t|
      t.string   :name, :limit => 64,    :null => false
      t.string   :number, :limit => 64,  :null => false
      t.integer  :tag_category_id,       :null => false
      t.timestamps
    end
    add_index :tags, :name
    add_index :tags, :number, :unique => true
    add_index :tags, :tag_category_id
  end

  def self.down
    drop_table   :tags
  end
end
