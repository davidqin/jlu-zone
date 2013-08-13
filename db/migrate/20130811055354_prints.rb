class Prints < ActiveRecord::Migration
  def up
    create_table :prints, :force => true do |t|

      t.references :print_house, :null => false
      t.references :fonder, :null => false

      t.boolean :is_completed, :null => false, :default => false

      t.timestamp :completed_at, :null => true
      t.timestamp :deadline, :null => false

      t.timestamps
    end
    add_index :prints, :fonder_id, :name => :idx_fonder
  end

  def down
    drop_table :prints
  end
end
