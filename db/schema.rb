# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100221065359) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
    t.string   "subtitle"
    t.text     "description"
    t.string   "author"
    t.integer  "theme_id"
    t.string   "google_analytics_id"
    t.string   "itunes_url"
    t.string   "small_artwork_url"
    t.text     "screenshots"
    t.string   "domain"
    t.string   "large_artwork_url"
    t.string   "itunes_id"
  end

  create_table "features", :force => true do |t|
    t.string   "body"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "features", ["app_id"], :name => "index_features_on_app_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "links", ["app_id"], :name => "index_links_on_app_id"

  create_table "themes", :force => true do |t|
    t.string   "name"
    t.text     "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",              :default => false
  end

end
