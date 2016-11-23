class MapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    maps = Map.all
    maps.inspect
    
  end
  
  def create
    upper_right = {
      "latitude" => BigDecimal.new(params[:upper_right_latitude]),
      "longitude" => BigDecimal.new(params[:upper_right_longitude])
    }
    
    lower_left = {
      "latitude" => BigDecimal.new(params[:lower_left_latitude]),
      "longitude" => BigDecimal.new(params[:lower_left_longitude])
    }
    
    map = Map.new
    map.upper_right = upper_right
    map.lower_left = lower_left
    map.name = params[:name]
    map.user = current_user
    
    if map.save!
      flash[:success] = "Created new map #{map.name}!"
      redirect_to map_path(map)
    else
      flash[:error] = "Unable to create new map #{map.name}."
      redirect_to new_map_path
    end
    
  end
  
  def new 
    
  end
  
  def edit
    
  end
  
  def show 
    @map = Map.find(params[:id])
    if @map.user != current_user
      flash[:error] = "You do not own this map."
      redirect_to root_path
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
