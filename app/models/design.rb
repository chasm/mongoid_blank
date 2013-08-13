class Design
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :periods
  
  field :id, type: String
  field :title, type: String
  
  validates_presence_of :id
  validates_presence_of :title
end
