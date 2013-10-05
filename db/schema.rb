# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131005184215) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "logo"
    t.integer  "organizer_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "private"
    t.string   "venue"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "messages", :force => true do |t|
    t.integer  "organizer_id"
    t.string   "sender_email"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "registrations", :force => true do |t|
    t.integer  "attendee_id"
    t.integer  "event_id"
    t.integer  "ticket_type_id"
    t.boolean  "paid"
    t.string   "ticket_pdf"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "ticket_types", :force => true do |t|
    t.string   "name"
    t.datetime "sales_end"
    t.float    "price"
    t.float    "fee"
    t.text     "description"
    t.boolean  "sold_out"
    t.integer  "event_id"
    t.integer  "total_quantity"
    t.integer  "max_per_attendee"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
