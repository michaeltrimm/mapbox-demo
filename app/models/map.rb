class Map
  include Mongoid::Document
  has_many :map_markers
  belongs_to :user
  
  field :name, type: String
  field :upper_right, type: Hash
  field :lower_left, type: Hash
  
  
  def center
    x = 0.0
    y = 0.0
    z = 0.0
    
    [self.upper_right, self.lower_left].each do |pair|
      logger.debug pair.inspect
      _lat = pair[:latitude].to_f * Math::PI / 180
      _lon = pair[:longitude].to_f * Math::PI / 180
      
      debug = {:_lat => _lat, :_lon => _lon }
      logger.debug debug.inspect
      
      a = Math.cos(_lat) * Math.cos(_lon)
      b = Math.cos(_lat) * Math.sin(_lon)
      c = Math.sin(_lat)
      
      debug = {:a => a, :b => b, :c => c}
      logger.debug debug.inspect
      
      x += a
      y += b
      z += c
      
      debug = {:x => x, :y => y, :z => z}
      logger.debug debug.inspect
    end
    
    logger.debug "Before /="
    logger.debug x.to_s.inspect
    logger.debug y.to_s.inspect
    logger.debug z.to_s.inspect
    
    x /= 2
    y /= 2
    z /= 2
    
    logger.debug "After /="
    logger.debug x.to_s.inspect
    logger.debug y.to_s.inspect
    logger.debug z.to_s.inspect
    
    lon = Math.atan2(y, x)
    hyp = Math.hypot(x,y)
    lat = Math.atan2(z, hyp)
    
    logger.debug lon.inspect
    logger.debug hyp.inspect
    logger.debug lat.inspect
    
    result = {
      :latitude => lat * 180 / Math::PI,
      :longitude => lon * 180 / Math::PI
    }
    
    logger.debug result
    
    return result
  end
end