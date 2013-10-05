class Registration < ActiveRecord::Base
  attr_accessible :attendee_id, :event_id, :paid, :ticket_pdf, :ticket_type_id
end
