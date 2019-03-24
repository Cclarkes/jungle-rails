class User < ActiveRecord::Base
  has_many :reviews
  
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  
end