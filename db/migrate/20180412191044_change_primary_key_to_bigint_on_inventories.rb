class ChangePrimaryKeyToBigintOnInventories < ActiveRecord::Migration
  def change
    change_column :inventories, :upc, :integer, limit: 8
  end
end
