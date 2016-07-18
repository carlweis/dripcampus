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

ActiveRecord::Schema.define(version: 20160716000900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.text     "tags"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "campaigns", ["name"], name: "index_campaigns_on_name", unique: true, using: :btree
  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "subject"
    t.text     "body"
    t.integer  "wait",        default: 5
    t.string   "interval",    default: "minutes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "messages", ["campaign_id"], name: "index_messages_on_campaign_id", using: :btree
  add_index "messages", ["subject"], name: "index_messages_on_subject", unique: true, using: :btree

  create_table "subscribers", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "source",      default: "website"
    t.integer  "sends",       default: 0
    t.integer  "opens",       default: 0
    t.integer  "replies",     default: 0
    t.integer  "clicks",      default: 0
    t.boolean  "opt_out",     default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "subscribers", ["campaign_id"], name: "index_subscribers_on_campaign_id", using: :btree
  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true, using: :btree
  add_index "subscribers", ["first_name"], name: "index_subscribers_on_first_name", using: :btree
  add_index "subscribers", ["last_name"], name: "index_subscribers_on_last_name", using: :btree
  add_index "subscribers", ["source"], name: "index_subscribers_on_source", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "account_id",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "campaigns", "users"
  add_foreign_key "messages", "campaigns"
  add_foreign_key "subscribers", "campaigns"
end
