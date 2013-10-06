class TicketType < ActiveRecord::Base
  attr_accessible :description, :event_id, :fee, :max_per_attendee, :name, :price, :sales_end, :sold_out, :total_quantity

  validates :name, :sales_end, :price, :fee, :description, :event_id, :total_quantity, :max_per_attendee, presence: true
  validates :price, :fee, format: { with: /^\d*\.\d{0,2}$/ }
  validates :price, :fee, numericality: { greater_than: 0 }
  validates :max_per_attendee, :total_quantity, numericality: { greater_than: 0, only_integer: true }
  validates :name, length: { in: 5..50}
  validates :description, length: { in: 100..2000}
  validates :max_per_attendee, length: { in: 1..2 }
  validates :total_quantity, length: { in: 1..4 }
end
