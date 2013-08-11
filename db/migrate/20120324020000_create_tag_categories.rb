class CreateTagCategories < ActiveRecord::Migration
  def self.up
    create_table :tag_categories, :force => true do |t|
      t.string :name, :null => false
    end
    add_index :tag_categories, :name
  end

  def self.down
    drop_table :tag_categories
  end
end
