class MapController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    maps = Map.all
    maps.inspect
    
  end
  
end
