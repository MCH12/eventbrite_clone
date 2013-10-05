class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.datetime :sales_end
      t.float :price
      t.float :fee
      t.text :description
      t.boolean :sold_out
      t.integer :event_id
      t.integer :total_quantity
      t.integer :max_per_attendee

      t.timestamps
    end
  end
end
