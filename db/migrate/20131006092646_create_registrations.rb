class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :attendee
      t.references :event
      t.references :ticket_type
      t.boolean :paid
      t.string :ticket_pdf

      t.timestamps
    end
    add_index :registrations, :attendee_id
    add_index :registrations, :event_id
    add_index :registrations, :ticket_type_id
  end
end
