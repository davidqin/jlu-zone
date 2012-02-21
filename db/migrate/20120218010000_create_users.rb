class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string  :hashed_password,      :limit => 64,  :null => false
      t.string  :account,              :limit => 64,  :null => false
      t.integer :reputation,           :default => 1000
      t.integer :gender,               :default => 0
      t.integer :level,                :default => 0
      t.string  :nickname
      t.string  :campus
      t.string  :department
      t.string  :major
      t.string  :grade
      t.string  :renren
      t.string  :qq
      t.string  :email
      t.string  :idiograph
      t.timestamps
    end
    add_index :users, :account, :name => :index_find_user_by_unique_account, :unique => true
  end

  def self.down
    remove_index :users, :name => :index_find_user_by_unique_account
    drop_table :users
  end
end
