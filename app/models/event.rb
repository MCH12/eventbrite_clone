class Event < ActiveRecord::Base
  attr_accessible :address, :city, :private_status, :end_datetime, :logo, :name, :organizer_id, :start_datetime, :state, :zip_code, :terms_of_service

  validates  :name, :venue, :address, :city,  :state, :zip_code, :organizer_id, :start_datetime, :end_datetime, presence: true
  # validates_acceptance_of  :terms_of_service
  validates :private_status, inclusion: { in: [true, false], message: "can't be blank" }
  validates :zip_code, format: { with: /^\d{5}$/, message: "must be exactly 5 digits" }
  validates :state, inclusion: { in: $STATES }
  validates :name, :address, :city, length: { within: 5..50 }
end
