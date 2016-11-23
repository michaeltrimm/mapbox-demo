class MapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @maps = Map.where(user_id: current_user.id).all
    
  end
  
  def create
    bounds = get_bounds
    
    map = Map.new
    map.upper_right = bounds[:ne]
    map.lower_left = bounds[:sw]
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
    @map = get_user_map_by_id(params[:id])
  end
  
  def show 
    @map = get_user_map_by_id(params[:id])
  end
  
  def update
    bounds = get_bounds
    
    map = get_user_map_by_id(params[:id])
    map.name = params[:name]
    map.upper_right = bounds[:ne]
    map.lower_left = bounds[:sw]
    
    if map.save!
      flash[:success] = "Updated map #{map.name}!"
      redirect_to map_path(map)
    else
      flash[:error] = "Unable to save map #{map.name}."
      redirect_to edit_map_path(map)
    end
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
  
  private
  
  def get_user_map_by_id id
    map = Map.find(id)
    if map.user != current_user
      flash[:error] = "You do not own this map."
      redirect_to root_path
    end
    return map
  end
  
  def get_bounds
    upper_right = {
      "latitude" => BigDecimal.new(params[:upper_right_latitude]),
      "longitude" => BigDecimal.new(params[:upper_right_longitude])
    }
    
    lower_left = {
      "latitude" => BigDecimal.new(params[:lower_left_latitude]),
      "longitude" => BigDecimal.new(params[:lower_left_longitude])
    }
    return {ne: upper_right, sw: lower_left}
  end
  
end
