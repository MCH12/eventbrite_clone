class TicketType < ActiveRecord::Base
  attr_accessible :description, :event_id, :fee, :max_per_attendee, :name, :price, :sales_end, :sold_out, :total_quantity
end
