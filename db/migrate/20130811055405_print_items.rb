class PrintItems < ActiveRecord::Migration
  def up
    create_table :print_items, :force => true do |t|

      t.references :print, :null => false

      t.string :paper_size, :null => false, :default => 'A4'
      t.string :memo, :null => false, :default => ''

      t.integer :copies, :null => false, :default => 1
      t.integer :style, :null => false, :default => 1
      t.integer :start_page, :null => false, :default => 1
      t.integer :end_page, :null => false, :default => 0

      t.boolean :single_page, :null => false, :default => true

      t.timestamps
    end
    add_index :print_items, :print_id, :name => :idx_print
  end

  def down
  end
end
