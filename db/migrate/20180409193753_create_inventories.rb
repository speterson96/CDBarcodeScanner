class CreateInventories < ActiveRecord::Migration
  def up
    create_table :inventories, id: false do |t|
      t.string :upc, primary_key: true
      t.string :title
      t.string :brand
      t.string :description
      t.integer :user_id
    end
   #execute "ALTER TABLE inventories ADD PRIMARY KEY (upc);"
  end
  
  def down
    
  end
end