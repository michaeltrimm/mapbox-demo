class Map {
  include Mongoid::Document
  
  has_many :mapmarkers
}