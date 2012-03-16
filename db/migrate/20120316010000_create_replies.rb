class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.integer  :resource_id,      :null => false, :limit => 100
      t.string   :resource_type,    :null => false, :limit => 100
      t.integer  :user_id,          :null => false
      t.text     :content,          :null => false
      t.timestamps
    end
    add_index :replies, [:resource_type, :resource_id]
  end

  def self.down
    remove_index :replies, [:resource_type, :resource_id]
    drop_table :versions
  end
end
