class InventoryController < ApplicationController
  before_action :index 
  require 'rest-client'

  def index
    @inventory = Inventory.all 
  end
  
  def inventory
  end
  
  def addItem 
    
    response = RestClient.post("https://api.upcitemdb.com/prod/trial/lookup",
      { 'upc' => params[:upc] }.to_json,
      {
        :content_type => :json,
        :accept => :json,
      }
    )
    puts "status: #{response.code}"
    puts "----headers----"
    puts response.headers
    puts "----body----"
    puts response
   
   @inventory = Inventory.create(
      upc: params[:upc], 
      title: response.title,
      brand: response.brand,
      description: response.description
    )
    if @inventory.save
      respond_to do |format|
          format.html {redirect_to "/inventory"}
      end 
    end   
  end
  
end
