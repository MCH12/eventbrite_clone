class Event < ActiveRecord::Base
  attr_accessor :terms_of_service
  attr_accessible :address, :city, :private_status, :end_datetime, :logo, :name, :organizer_id, :start_datetime, :state, :zip_code

  before_save :default_values

  validates  :name, :venue, :address, :city,  :state, :zip_code, :organizer_id, :start_datetime, :end_datetime, presence: true
  validates :private_status, inclusion: { in: [true, false], message: "can't be blank" }
  validates :zip_code, format: { with: /^\d{5}$/, message: "must be exactly 5 digits" }
  validates :state, inclusion: { in: $STATES }
  validates :name, :address, :city, length: { within: 5..50 }
  validate do |event|
    if event.terms_of_service == "0"
      event.errors[:base] << "You must accept the terms of service to continue."
    end
  end

  private

  def default_values
    self.terms_of_service ||= "0"
  end

end
