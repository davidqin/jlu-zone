class CreateTagsTopicsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :tags_topics, :id => false do |t|
      t.integer :tag_id,     :null => false
      t.integer :topic_id,   :null => false
    end
    add_index :tags_topics, :tag_id
    add_index :tags_topics, :topic_id
  end

  def self.down
    drop_table :tags_topics
  end
end
