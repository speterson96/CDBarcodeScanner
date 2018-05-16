class CreateInventories < ActiveRecord::Migration
  def up
    create_table :inventories do |t|
      t.string :upc, primary_key: true
      t.string :title
      t.string :brand
      t.string :description
      t.string :image
      t.integer :user_id
    end
   #execute "ALTER TABLE inventories ADD PRIMARY KEY (upc);"
  end
  
  def down
    
  end
end