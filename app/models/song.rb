class Song
  include Mongoid::Document

  field :name, type: String
  field :lyrics, type: String
  field :music_url, type: String
  field :video_url, type: String
  field :rating, type: Integer

  embedded_in :band
end