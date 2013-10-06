class Message < ActiveRecord::Base
  attr_accessible :content, :organizer_id, :sender_email

  validates :content, :organizer_id, :sender_email, presence: true
  validates :sender_email, format: { with: /^\S*@\S*\.\w{2,6}$/ }
  validates :content, length: { maximum: 10000 }
end
