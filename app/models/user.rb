class User < ActiveRecord::Base

  has_secure_password

  before_save {self.email = email.downcase }
  before_create :create_remember_token

  attr_accessible :description, :email, :facebook_id, :first_name, :last_name, :password, :password_confirmation, :twitter_id, :username, :website, :terms_of_service

  has_many :registrations, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :registrations, class_name: "Event"
  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id", dependent: :destroy
  has_many :messages, foreign_key: "organizer_id", dependent: :destroy

# validates :email, confirmation: true
  validates :password, confirmation: true
  validates :username, :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :email, format: { with: /^\S*@\S*\.\w{2,6}$/ }
  validates :username, length: { in: 3..30 }
  validates_uniqueness_of :facebook_id, message: "id has already been taken", if: "facebook_id.present?"
  validates_uniqueness_of :twitter_id, message: "id has already been taken", if: "twitter_id.present?"
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :website, format: { with: /^(?:[a-zA-Z0-9]+|([a-zA-Z0-9]+\.[a-zA-Z0-9]+))\.(?:[a-zA-Z]{2,6}\.[a-zA-Z]{2}|[a-zA-Z]{3})$/ }, if: "website.present?"
  validates :terms_of_service, format: { with: /[1]/, message: "must be accepted" }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
