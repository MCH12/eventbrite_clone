class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :attendee_id
      t.integer :event_id
      t.integer :ticket_type_id
      t.boolean :paid
      t.string :ticket_pdf

      t.timestamps
    end
  end
end
