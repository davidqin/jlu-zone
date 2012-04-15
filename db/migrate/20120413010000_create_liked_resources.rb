class CreateLikedResources  < ActiveRecord::Migration
  def self.up
    create_table :liked_resources, :force => true do |t|
      t.integer    :user_id,               :null => false
      t.integer    :liked_resource_id,     :null => false
      t.string     :liked_resource_type,   :null => false
      t.timestamps
    end
    add_index :liked_resources, [:user_id]
    add_index :liked_resources, [:liked_resource_id, :liked_resource_type], :name => :liked_resource
  end

  def self.down
    drop_table :liked_resources
  end
end