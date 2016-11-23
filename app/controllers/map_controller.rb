class MapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    maps = Map.all
    maps.inspect
    
  end
  
  def create
    
  end
  
  def new 
    
  end
  
  def edit
    
  end
  
  def show 
    map_id = params[:map_id]
    map = Map.where(user_id: current_user.id, id: map_id)
    map.inspect
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def map_params
    params.require(:map).permit(:upper_right, :lower_left)
  end
  
end
