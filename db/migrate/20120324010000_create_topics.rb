class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics, :force => true do |t|
      t.string      :name,         :limit => 64,   :null => false
      t.references  :fonder,       :null => false
      t.text        :content
      t.string      :number,       :null => false
      t.integer     :replies_num,  :null => false, :default => 0
      t.integer     :read_times,   :null => false, :default => 0
      t.timestamps
    end
    add_index :topics, :fonder_id, :name => :index_find_topic_by_fonder_id
  end

  def self.down
    remove_index :topics, :name => :index_find_topic_by_fonder_id
    drop_table   :topics
  end
end
