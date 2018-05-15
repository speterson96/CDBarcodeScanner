class InventoryController < ApplicationController
  before_filter :authenticate_user!
  before_action :index 
  
  require 'rest-client'

  def index
    @inventory = Inventory.all 
  end
  
  def manuallyAddItem
  puts session['user_id'] && params['title']
  puts params['title']
    @inventory = Inventory.create(
      upc: session['user_id'] && params['title'],
      title: params['name'],
      brand: params['brand'],
      description: params['description'].gsub(/<\/?[^>]*>/, " "),
      user_id: session['user_id']
    )
    
    if @inventory.save
      respond_to do |format|
          format.html {redirect_to "/inventory"}
      end 
    end 
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
      image: json['images'].first,
      user_id: session['user_id']
    )
    
    if @inventory.save
      respond_to do |format|
          format.html {redirect_to "/inventory"}
      end 
    end    
  end
  
end
