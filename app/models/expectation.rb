class Expectation
  include Mongoid::Document
  
  embedded_in :period
  
  field :id, type: String
  field :behavior, type: String
  
  validates_presence_of :id
  validates_presence_of :behavior
end
