class Band
  include Mongoid::Document

  field :name,    type: String
  field :bio,     type: String
  field :url,     type: String
  field :rating,  type: Integer

  embeds_many :songs
end