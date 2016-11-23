class MapMarker
  include Mongoid::Document
  belongs_to :map
end