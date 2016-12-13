class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews
  has_many :orders

  validates :email,
    uniqueness: true,
    uniqueness: { case_sensitive: false }, 
    format: { without: /\s/ }
  validates :password_digest,
    presence: true,
    length: { minimum: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user.authenticate(password) ? user : nil
  end

end
