class CreateFollowedResources  < ActiveRecord::Migration
  def self.up
    create_table :followed_resources, :force => true do |t|
      t.integer    :user_id,                  :null => false
      t.integer    :resource_id,     :null => false
      t.string     :resource_type,   :null => false
      t.timestamps
    end
    add_index :followed_resources, [:user_id]
    add_index :followed_resources, [:resource_id, :resource_type]
  end

  def self.down
    drop_table :followed_resources
  end
end