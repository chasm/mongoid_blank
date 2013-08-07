class Topic < Message
  
  field :topic, type: String
  
  validates :topic, presence: true
end
