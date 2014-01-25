class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  # :name validation
  validates :name, presence: true, length: { maximum: 50 }
  
  # :email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true, 
    format: { with: VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }
    
  # secure :password  
  has_secure_password
  validates :password, length: { minimum: 6 }
end
