class InventoryController < ApplicationController
  before_action :index 
  
  require 'rest-client'

  def index
    @inventory = Inventory.all 
  end
  
  def inventory
  end
  
  def destroy
    @inventory = Inventory.find(params[:id])
    
    if params[:user_id] = session['user_id'] and @inventory.user_id = session['user_id']
      @inventory.destroy
    end
    
    redirect_to inventory_path
  end
  
  def addItem 
  
    upc = params[:upc].tr('^0-9', '')
    response = RestClient.post("https://api.upcitemdb.com/prod/trial/lookup",
      { 'upc' => upc }.to_json,
      {
        :content_type => :json,
        :accept => :json,
      }
    )

    json = JSON.parse(response.body)["items"].first
    
    @inventory = Inventory.create(
      upc: upc, 
      title: json['title'],
      brand: json['brand'],
      description: json['description'].gsub(/<\/?[^>]*>/, " "),
      user_id: session['user_id']
    )
    
    if @inventory.save
      respond_to do |format|
          format.html {redirect_to "/inventory"}
      end 
    end 
    
  end
  
end
