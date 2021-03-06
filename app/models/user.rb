class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_secure_password

  has_many :comments
  has_many :violations
  has_many :fouls
end
