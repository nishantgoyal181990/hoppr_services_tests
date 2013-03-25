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

ActiveRecord::Schema.define(:version => 20130325124644) do

  create_table "keywords", :force => true do |t|
    t.string   "keyword"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "receivemessages", :force => true do |t|
    t.integer  "simcard_id"
    t.integer  "sendmessage_id"
    t.string   "sender",         :limit => nil
    t.text     "message"
    t.datetime "date"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sendmessages", :force => true do |t|
    t.text     "message_text"
    t.integer  "recipient_number"
    t.datetime "date"
    t.datetime "time"
    t.integer  "simcard_id"
    t.string   "delievery_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simcards", :force => true do |t|
    t.integer  "simid"
    t.string   "operator"
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telcos", :force => true do |t|
    t.string   "telco"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
