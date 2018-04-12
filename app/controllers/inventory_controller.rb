class InventoryController < ApplicationController
  def index
  end
  
  def inventory
  end
  
  def addItem
  
    puts "Added Item: " + params[:upc]
    respond_to do |format|
         format.html {redirect_to "/inventory"}
      end 
  end
  
end
