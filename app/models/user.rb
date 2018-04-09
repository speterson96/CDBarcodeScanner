class User < ActiveRecord::Base
  	has_many :Inventory
end
