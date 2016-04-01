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

ActiveRecord::Schema.define(:version => 201603310419000) do

  create_table "addresses", :force => true do |t|
    t.float    "latitude",   :null => false
    t.float    "longitude",  :null => false
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "landlords", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "landlords", ["name"], :name => "index_landlords_on_name"

  create_table "listing_details", :force => true do |t|
    t.integer  "price",          :null => false
    t.integer  "bedroom_count"
    t.integer  "bathroom_count"
    t.string   "title"
    t.text     "description"
    t.integer  "listing_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "listing_identifier", :null => false
    t.string   "listing_source_url", :null => false
    t.integer  "address_id"
    t.integer  "landlord_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "listings", ["listing_identifier"], :name => "index_listings_on_listing_identifier"

  create_table "photos", :force => true do |t|
    t.string   "url"
    t.string   "caption"
    t.text     "description"
    t.integer  "seq"
    t.integer  "listings_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
