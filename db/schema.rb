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

ActiveRecord::Schema.define(version: 20140924084927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.integer  "user_main_id"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assigned_regions", force: true do |t|
    t.integer  "user_id"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entertainment_parent_companies", force: true do |t|
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
    t.string   "webpage_director_first_name"
    t.string   "webpage_director_skype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "parent_company_contact_person_skype_id"
  end

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
    t.string   "contact_person_position"
    t.string   "contact_person_phone"
    t.string   "contact_person_email"
    t.string   "contact_person_salutation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "representative_name"
    t.string   "division"
    t.string   "parent_company_contact_person_skype_id"
    t.string   "webpage_director_skype_id"
    t.string   "webpage_director_first_name"
    t.integer  "ee_user_id"
  end

  create_table "funny_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
  end

  create_table "paintings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "user_id"
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
    t.integer  "user_id"
    t.integer  "region_id"
    t.string   "name"
  end

  create_table "roles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
  end

  create_table "territories", force: true do |t|
    t.integer  "region_id"
    t.string   "name"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
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
    t.string   "age"
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
    t.string   "user_main_id"
    t.integer  "region_id"
    t.integer  "division_id"
    t.integer  "region_user_number"
    t.integer  "role_id"
    t.string   "emergency_contact_mailing_state"
    t.string   "emergency_contact_mailing_country"
    t.string   "corporate_email"
    t.string   "personal_mailing_street_address_2"
    t.string   "skype_id"
    t.string   "government_tax_id_number"
    t.integer  "photo_id"
    t.string   "job_reference"
    t.integer  "ee_user_id"
    t.boolean  "approved",                           default: false, null: false
    t.integer  "referrer"
    t.string   "password_clone"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "will_filter_filters", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "will_filter_filters", ["user_id"], name: "index_will_filter_filters_on_user_id", using: :btree

end
