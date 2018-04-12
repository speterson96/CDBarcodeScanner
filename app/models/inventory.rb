class Inventory < ActiveRecord::Base
  belongs_to :User
  #self.primary_key = "upc"
  
end
