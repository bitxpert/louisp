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

ActiveRecord::Schema.define(version: 20140822130047) do

  create_table "entertainments", force: true do |t|
    t.string   "region"
    t.string   "representative_id"
    t.string   "url"
    t.string   "name"
    t.string   "sub_category"
    t.string   "function"
    t.string   "category"
    t.string   "icon"
    t.string   "email"
    t.string   "phone_number"
    t.string   "country"
    t.string   "state_or_province"
    t.string   "city"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "postal_code"
    t.string   "contact_person_first_name"
    t.string   "contact_person_last_name"
    t.string   "url_picture"
    t.string   "parent_company_postal_code"
    t.string   "parent_company_street_address_2"
    t.string   "parent_company_street_address_1"
    t.string   "parent_company_city"
    t.string   "parent_company_contact_person_salutation"
    t.string   "parent_company_state_or_province"
    t.string   "parent_company_contact_person_email_address"
    t.string   "parent_company_contact_person_last_name"
    t.string   "parent_company_country"
    t.string   "parent_company_contact_person_phone_number"
    t.string   "parent_company_contact_person_first_name"
    t.string   "parent_comapny_name"
    t.string   "webpage_director_phone_number"
    t.string   "webpage_director_email_address"
    t.string   "webpage_director_salutation"
    t.string   "webpage_director_last_name"
    t.string   "webpage_director_contact_person_first_name"
    t.string   "webpage_director_company"
    t.string   "password"
    t.integer  "user_id",                                     limit: 255
    t.string   "contact_person_position"
    t.string   "contact_person_phone"
    t.string   "contact_person_email"
    t.string   "contact_person_salutation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funny_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
  end

  create_table "models", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true

  create_table "paintings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "user_id"
  end

  create_table "post_attachments", force: true do |t|
    t.integer  "post_id"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "territory"
    t.string   "gdp_usd_billion"
    t.string   "population"
    t.string   "gdp_person_usd"
    t.string   "ee_score"
    t.string   "first_language"
    t.string   "second_language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "sex"
    t.integer  "age",                                limit: 255
    t.string   "salutation"
    t.string   "title"
    t.string   "division"
    t.string   "region"
    t.string   "company_email"
    t.string   "company_phone"
    t.string   "company_mailing_street_address_1"
    t.string   "company_mailing_street_address_2"
    t.string   "company_mailing_state_or_province"
    t.string   "company_mailing_country"
    t.string   "company_mailing_postal_code"
    t.string   "personal_email"
    t.string   "personal_phone"
    t.string   "personal_mailing_street_address"
    t.string   "emergency_contact_mailing_city"
    t.string   "emergency_contact_mailing_street_2"
    t.string   "emergency_contact_mailing_street_1"
    t.string   "emergency_contact_relationship"
    t.string   "emergency_contact_phone_number"
    t.string   "emergency_contact_email"
    t.string   "emergency_contact_last_name"
    t.string   "emergency_contact_first_name"
    t.string   "identification_photo"
    t.string   "federal_id_number"
    t.string   "country_of_residence"
    t.string   "country_of_citizenship"
    t.string   "birthday"
    t.string   "date_of_hire"
    t.string   "personal_mailing_country"
    t.string   "personal_mailing_postal_code"
    t.string   "personal_mailing_state_or_province"
    t.string   "personal_mailing_city"
    t.string   "personal_mailing_street_2"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
