class CreateUserNotices < ActiveRecord::Migration
  def self.up
    create_table :user_notices, :force => true do |t|
      t.references :to_user,              :null => false
      t.references :from_user,            :null => false
      t.integer    :notice_resource_id,   :null => false
      t.string     :notice_resource_type, :null => false
      t.boolean    :read,                 :null => false, :default => false
      t.timestamps
    end
    add_index :user_notices, [:to_user_id, :read]
  end

  def self.down
    drop_table :user_notices
  end
end
