class Reply
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String
  field :user_id, type: String
  field :user_name, type: String
  field :user_email, type: String
  
  embedded_in :discussion
  
  embedded_in :reply
  embeds_many :replies
  
  validates :content, presence: true
  validates :user_id, presence: true
  validates :user_name, presence: true
  validates :user_email, presence: true
end
