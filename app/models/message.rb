class Message < ActiveRecord::Base
  attr_accessible :content, :organizer_id, :sender_email
end
