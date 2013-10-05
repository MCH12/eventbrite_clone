class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :username

# validates :email, confirmation: true
  validates :username, :password_digest, :email, presence: true
  validates :email, format: { with: /^\S*@\S*\.\w{2,6}$/ }
  validates :username, length: { in: 3..30 }
  validates :username, :email, uniqueness: true
end
