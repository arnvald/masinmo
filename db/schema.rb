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

ActiveRecord::Schema.define(:version => 20120115131330) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "advertisers", :force => true do |t|
    t.string "name",  :null => false
    t.string "phone", :null => false
    t.string "email", :null => false
  end

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",      :null => false
  end

  add_index "comments", ["offer_id"], :name => "index_comments_on_offer_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "contracts", :force => true do |t|
    t.integer "advertiser_id"
    t.date    "start_at"
    t.date    "finish_at"
    t.integer "placement_id"
    t.string  "banner"
  end

  create_table "favorites", :force => true do |t|
    t.integer "user_id"
    t.integer "offer_id"
  end

  add_index "favorites", ["offer_id"], :name => "index_favorites_on_offer_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "summary"
    t.string   "description"
    t.string   "street"
    t.string   "building"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.float    "price",           :default => 0.0
    t.string   "state",           :default => "draft", :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "kind",            :default => "sell",  :null => false
    t.integer  "rooms"
    t.integer  "bathrooms"
    t.string   "property_type"
    t.boolean  "internet",        :default => false
    t.boolean  "furnished",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "expiry_date"
    t.boolean  "dishwasher",      :default => false,   :null => false
    t.boolean  "washing_machine", :default => false,   :null => false
    t.boolean  "tv",              :default => false,   :null => false
    t.boolean  "microwave",       :default => false,   :null => false
    t.boolean  "storage_room",    :default => false,   :null => false
    t.boolean  "terrace",         :default => false,   :null => false
    t.boolean  "balcony",         :default => false,   :null => false
    t.boolean  "cable_tv",        :default => false,   :null => false
    t.boolean  "heating",         :default => false,   :null => false
    t.boolean  "garage",          :default => false,   :null => false
    t.boolean  "gym",             :default => false,   :null => false
    t.boolean  "tennis_court",    :default => false,   :null => false
    t.boolean  "swimming_pool",   :default => false,   :null => false
  end

  add_index "offers", ["city"], :name => "index_offers_on_city"
  add_index "offers", ["country"], :name => "index_offers_on_country"
  add_index "offers", ["state"], :name => "index_offers_on_state"
  add_index "offers", ["user_id"], :name => "index_offers_on_user_id"

  create_table "photos", :force => true do |t|
    t.string  "image"
    t.string  "title"
    t.string  "description"
    t.integer "offer_id"
  end

  create_table "placements", :force => true do |t|
    t.string "name"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                 :default => false, :null => false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
