class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies, :force => true do |t|
      t.integer  :subject_id,      :null => false, :limit => 100
      t.string   :subject_type,    :null => false, :limit => 100
      t.integer  :fonder_id,       :null => false
      t.text     :content,          :null => false
      t.integer  :floor_num,        :null => false
      t.string   :number,           :null => false
      t.timestamps
    end
    add_index :replies, [:subject_type, :subject_id]
  end

  def self.down
    remove_index :replies, [:subject_type, :subject_id]
  end
end
