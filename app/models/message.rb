class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String
  
  embeds_many :replies
  
  belongs_to :author, class_name: "User", inverse_of: :discussions_started, autosave: true
  belongs_to :recipient, class_name: "User", inverse_of: :discussions_joined, autosave: true
  
  validates :content, presence: true
end
