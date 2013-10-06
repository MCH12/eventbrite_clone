class Registration < ActiveRecord::Base
  attr_accessor :terms_of_service
  attr_accessible :attendee_id, :event_id, :paid, :ticket_pdf, :ticket_type_id

  before_save :default_values

  validates :attendee_id, :event_id, :ticket_pdf, :ticket_type_id, presence: true
  validates_uniqueness_of :ticket_pdf
  validates :paid, inclusion: { in: [true] }

  validate do |registration|
    if registration.terms_of_service == "0"
      registration.errors[:base] << "You must accept the terms of service to continue."
    end
  end

  private

  def default_values
    self.terms_of_service ||= "0"
    self.paid ||= false
  end

end
