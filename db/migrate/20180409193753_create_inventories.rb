class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories, id: false do |t|
      t.primary_key :upc
      t.string :title
      t.string :brand
      t.string :description
    end
  end
end
Added models