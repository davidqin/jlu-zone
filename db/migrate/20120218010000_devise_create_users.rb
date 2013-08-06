class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :number,             :null => false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Encryptable
      # t.string :password_salt

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token
      t.integer :score, :default => 1000
      t.integer :gender, :default => 0
      t.string  :nickname
      t.string  :campus
      t.string  :department
      t.string  :major
      t.string  :grade
      t.string  :renren
      t.string  :qq
      t.string  :idiograph

      t.boolean  :lock, :null => false, :default => false

      t.boolean  :full_info,         :null => false, :default => false
      t.integer  :today_topic_count, :null => false, :default => 0
      t.datetime :today_last_topic_time
      t.integer  :today_reply_count, :null => false, :default => 0
      t.datetime :today_last_reply_time
      t.integer  :today_photo_count, :null => false, :default => 0
      t.datetime :today_last_photo_time

      t.boolean   :admin_permission,     :null => false, :default => false
      t.boolean   :wiki_permission,      :null => false, :default => false
      t.boolean   :community_permission, :null => false, :default => false
      t.boolean   :photo_permission,     :null => false, :default => false


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end
end
