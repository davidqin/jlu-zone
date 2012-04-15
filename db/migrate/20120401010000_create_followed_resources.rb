class CreateFollowedResources  < ActiveRecord::Migration
  def self.up
    create_table :followed_resources, :force => true do |t|
      t.integer    :user_id,                  :null => false
      t.integer    :followed_resource_id,     :null => false
      t.string     :followed_resource_type,   :null => false
      t.timestamps
    end
    add_index :followed_resources, [:user_id]
    add_index :followed_resources, [:followed_resource_id, :followed_resource_type], :name => :followed_resource
  end

  def self.down
    drop_table :followed_resources
  end
end