class InventoryController < ApplicationController
  before_action :index 

  def index
    @inventory = Inventory.all 
  end
  
  def inventory
  end
  
  def addItem
   @inventory = Inventory.create(
      upc: params[:upc], 
      title: "Title",
      brand: "Branch",
      description: "Desc"
    )
    if @inventory.save
      respond_to do |format|
          format.html {redirect_to "/inventory"}
      end 
    end
    
  end
  
end
