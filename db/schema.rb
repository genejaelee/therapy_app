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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140326194958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "encrypted_name"
    t.string   "encrypted_name_salt"
    t.string   "encrypted_name_iv"
    t.string   "encrypted_email"
    t.string   "encrypted_email_salt"
    t.string   "encrypted_email_iv"
    t.string   "encrypted_zipcode"
    t.string   "encrypted_zipcode_salt"
    t.string   "encrypted_zipcode_iv"
    t.text     "encrypted_description"
    t.text     "encrypted_description_salt"
    t.text     "encrypted_description_iv"
    t.string   "encrypted_gender"
    t.string   "encrypted_gender_salt"
    t.string   "encrypted_gender_iv"
    t.string   "encrypted_age"
    t.string   "encrypted_age_salt"
    t.string   "encrypted_age_iv"
    t.string   "encrypted_insurance"
    t.string   "encrypted_insurance_salt"
    t.string   "encrypted_insurance_iv"
    t.string   "price"
    t.string   "promo_code"
    t.text     "responses",                  array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
