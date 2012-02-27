class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions, :force => true do |t|
      t.references :entry
      t.references :editor,       :limit => 64,  :null => false
      t.string     :number,       :null  => false
      t.text       :content
      t.timestamps
    end
    add_index :versions, [:entry_id, :number], :name => :index_find_version_by_unique_number, :unique => true
    add_index :versions, :entry_id,            :name => :index_find_version_by_entry
  end

  def self.down
    remove_index :versions, :number => :index_find_version_by_unique_number
    remove_index :versions, :number => :index_find_version_by_entry
    drop_table   :versions
  end
end
