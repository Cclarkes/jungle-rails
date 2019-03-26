class User < ActiveRecord::Base
  has_many :reviews
  
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false, message: "same"}
  validates :email, format: { without: /\s/, message: "must contain no spaces" }
  validates :password, presence: true
  validates :password, length: {minimum: 3}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @existing_user = User.find_by_email(email)
    puts @existing_user.inspect
    @existing_user.authenticate(password) ? @existing_user : nil
  end

end