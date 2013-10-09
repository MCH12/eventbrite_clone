class Registration < ActiveRecord::Base

  belongs_to :attendee, class_name: "User"
  belongs_to :event
  belongs_to :ticket_type
  attr_accessible :paid, :ticket_pdf

  before_save :default_values

  validates :attendee_id, :event_id, :ticket_pdf, :ticket_type_id, presence: true
  validates_uniqueness_of :ticket_pdf
  validates :paid, inclusion: { in: [true] }
  validates :terms_of_service, format: { with: /[1]/ }

  validate do |registration|
    if registration.terms_of_service == "0"
      registration.errors[:base] << "You must accept the terms of service to continue."
    end
  end

  private

  def default_values
    self.paid ||= false
  end

end
