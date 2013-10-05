class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :organizer_id
      t.string :sender_email
      t.text :content

      t.timestamps
    end
  end
end
