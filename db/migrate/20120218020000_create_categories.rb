class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string   :name,       :limit => 64,  :null => false
      t.string   :number,     :null  => false#url show  0.0.0.0:3000/entertainment
      t.timestamps
    end
    add_index :categories, :name, :name => :index_find_category_by_unique_name, :unique => true
  end

  def self.down
    remove_index :categories, :name => :index_find_category_by_unique_name
    drop_table :categories
  end
end
