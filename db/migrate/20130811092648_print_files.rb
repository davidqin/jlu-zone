class PrintFiles < ActiveRecord::Migration
  def up
    create_table :print_files, :force => true do |t|
      t.string :file, :null => false
      t.references :print_item, :null => false
    end
    add_index :print_files, :file, :name => :idx_file
    add_index :print_files, :print_item_id, :name => :idx_print_item_id
  end

  def down
  end
end
