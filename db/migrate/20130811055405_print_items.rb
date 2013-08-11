class PrintItems < ActiveRecord::Migration
  def up
    create_table :print_items, :force => true do |t|

      t.references :print, :null => false
      t.string :format, :null => false, :default => ''

      t.timestamps
    end
    add_index :print_items, :print_id, :name => :idx_print
  end

  def down
  end
end
