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

ActiveRecord::Schema.define(:version => 20131009061154) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "logo"
    t.integer  "organizer_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "venue"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.boolean  "private_status"
    t.string   "terms_of_service"
  end

  add_index "events", ["organizer_id"], :name => "index_events_on_organizer_id"

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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "terms_of_service"
  end

  add_index "registrations", ["attendee_id"], :name => "index_registrations_on_attendee_id"
  add_index "registrations", ["event_id"], :name => "index_registrations_on_event_id"
  add_index "registrations", ["ticket_type_id"], :name => "index_registrations_on_ticket_type_id"

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "terms_of_service"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
