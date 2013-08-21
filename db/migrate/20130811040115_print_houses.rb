class PrintHouses < ActiveRecord::Migration
  def up
    create_table :print_houses, :force => true do |t|

      t.string :name, :limit => 20, :null => false
      t.string :phone, :limit => 20, :null => false
      t.string :description, :limit => 200, :null => false
      t.string :ip, :limit => 30, :null => false

      #t.string :login_name, :null => false, :default => ""
      #t.string :encrypted_password, :null => false, :default => ""

      t.timestamps
    end
  end

  def down
    drop_table :print_houses
  end
end
