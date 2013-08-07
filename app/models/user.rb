class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessor :password, :password_confirmation
  
  field :name, type: String
  field :email, type: String
  
  field :salt, type: String
  field :fish, type: String
  
  field :code, type: String
  field :expires_at, type: Time
  
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  before_validation :downcase_email
  before_save :encrypt_password
  
  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def downcase_email
    self.email.downcase!
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
      self.password = nil
    end
  end
end
