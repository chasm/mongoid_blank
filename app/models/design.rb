class Design
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :periods
  
  field :title, type: String
  
  validates_presence_of :title
end
