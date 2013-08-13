class Period
  include Mongoid::Document
  
  embedded_in :design
  embeds_many :expectations
  
  field :id, type: String
  field :name, type: String
  field :activity, type: String
  field :starts_at, type: String
  field :ends_at, type: String
  
  validates_presence_of :id
  validates_presence_of :name
  
  validates_format_of :starts_at, :ends_at,
    with: /\A([0-1][0-9]|2[0-3]):[0-5](0|5)\Z/,
    allow_blank: true
end
