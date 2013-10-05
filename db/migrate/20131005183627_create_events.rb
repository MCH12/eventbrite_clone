class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :logo
      t.integer :organizer_id

      t.timestamps
    end
  end
end
