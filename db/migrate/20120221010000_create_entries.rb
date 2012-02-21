class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries, :force => true do |t|
      t.string       :name,         :limit => 64,  :null => false
      t.references   :fonder
      t.integer      :appreciation, :default => 0
      t.integer      :objection,    :default => 0
      t.timestamps
    end
    add_index :entries, :fonder_id, :name => :index_find_entry_by_fonder_id
  end

  def self.down
    remove_index :entries, :name => :index_find_entry_by_fonder_id
    drop_table   :entries
  end
end
