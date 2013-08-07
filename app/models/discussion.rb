class Discussion
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :topic, type: String
  field :content, type: String
  
  embeds_many :replies
  
  belongs_to :author, class_name: "User", inverse_of: :discussions_started, autosave: true
  belongs_to :recipient, class_name: "User", inverse_of: :discussions_joined, autosave: true
  
  validates :topic, presence: true
  validates :content, presence: true
end
