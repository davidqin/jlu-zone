class CreateTopicReadHistories  < ActiveRecord::Migration
  def self.up
    create_table :topic_read_histories, :force => true do |t|
      t.integer    :user_id,      :null => false
      t.integer    :topic_id,     :null => false
      t.datetime   :last_read_at, :null => false, :default => Time.now
    end
    add_index :topic_read_histories, [:user_id, :topic_id]
  end

  def self.down
    drop_table :topic_read_histories
  end
end