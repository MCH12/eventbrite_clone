class Event < ActiveRecord::Base
  belongs_to :organizer, class_name: "User"
  has_many :registrations, dependent: :destroy
  has_many :ticket_types, dependent: :destroy
  has_many :attendees, through: :registrations, class_name: "User"

  include StatesHelper

  attr_accessible :address, :city, :end_datetime, :logo, :name, :start_datetime, :state, :zip_code

  validates :terms_of_service, format: { with: /[1]/ }
  validates  :name, :venue, :address, :city,  :state, :zip_code, :organizer_id, :start_datetime, :end_datetime, presence: true
  validates :private_status, inclusion: { in: [true, false], message: "can't be blank" }
  validates :zip_code, format: { with: /^\d{5}$/, message: "must be exactly 5 digits" }
  validates :state, inclusion: { in: STATES }
  validates :name, :address, :city, length: { within: 5..50 }
  validate do |event|
    if event.terms_of_service == "0"
      event.errors[:base] << "You must accept the terms of service to continue."
    end
  end

end
