class CreateInventories < ActiveRecord::Migration
  def up
    create_table :inventories, id: false do |t|
      t.integer :upc, primary_key: true
      t.string :title
      t.string :brand
      t.string :description
      t.integer :user_id
    end
   #execute "ALTER TABLE inventories ADD PRIMARY KEY (upc);"
  end
  
  def down
    #drop_table :content_units
  end
end