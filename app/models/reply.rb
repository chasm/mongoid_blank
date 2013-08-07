class Reply < Message
  
  field :user_id, type: String
  field :user_name, type: String
  field :user_email, type: String
  
  embedded_in :message
  embeds_many :replies
  
  validates :user_id, presence: true
  validates :user_name, presence: true
  validates :user_email, presence: true
end
