class MapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @maps = Map.where(user_id: current_user.id).all
    
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
    if params[:id].nil?
      flash[:error] = "No such map to delete."
    else
      map = Map.find(params[:id])
      if map.user == current_user
        name = map.name
        if map.destroy!
          flash[:success] = "Deleted map named #{name}."
        else
          flash[:error] = "Unable to delete the map. Check the logs."
        end
      else 
        flash[:error] = "You do not own that map, you cannot delete it."
      end
    end
    redirect_to root_path
  end
  
end
