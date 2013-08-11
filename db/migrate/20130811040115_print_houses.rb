class PrintHouses < ActiveRecord::Migration
  def up
    create_table :print_houses, :force => true do |t|

      t.string :name, :limit => 20, :null => false
      t.string :phone, :limit => 20, :null => false
      t.string :description, :limit => 200, :null => false
      t.strint :ip, :limit => 30, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :print_houses
  end
end
