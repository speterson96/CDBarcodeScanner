class ChangeDataTypeForInventoryUserId < ActiveRecord::Migration
  def change
    change_column :inventories, :user_id, :string
  end
end
