class User < ActiveRecord::Base
  attr_accessible :description, :email, :facebook_id, :first_name, :last_name, :password_digest, :twitter_id, :username, :website

  has_many :registrations, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :registrations, class_name: "Event"
  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id", dependent: :destroy
  has_many :messages, foreign_key: "organizer_id", dependent: :destroy

# validates :email, confirmation: true
  validates :username, :password_digest, :email, presence: true
  validates :email, format: { with: /^\S*@\S*\.\w{2,6}$/ }
  validates :username, length: { in: 3..30 }
  validates :facebook_id, :twitter_id, :username, :email, uniqueness: true
  validates :website, format: { with: /^(?:[a-zA-Z0-9]+|([a-zA-Z0-9]+\.[a-zA-Z0-9]+))\.(?:[a-zA-Z]{2,6}\.[a-zA-Z]{2}|[a-zA-Z]{3})$/ }
  validates :terms_of_service, format: { with: /[1]/ }
end
