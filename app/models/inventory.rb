class Inventory < ActiveRecord::Base
  belong_to :User
  #self.primary_key = "upc"
  
  
  
end
