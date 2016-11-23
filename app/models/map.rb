class Map
  include Mongoid::Document
  has_many :map_markers
  belongs_to :user
  
  field :name, type: String
  field :upper_right, type: Hash
  field :lower_left, type: Hash
end