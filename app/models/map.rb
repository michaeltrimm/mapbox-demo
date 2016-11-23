class Map
  include Mongoid::Document
  has_many :mapmarkers
  belongs_to :user
end