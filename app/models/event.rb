class Event < ActiveRecord::Base
  attr_accessible :address, :city, :end_datetime, :logo, :name, :organizer_id, :start_datetime, :state, :zip
end
