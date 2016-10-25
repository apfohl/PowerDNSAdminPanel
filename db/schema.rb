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

ActiveRecord::Schema.define(version: 20161025132012) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "comments", force: :cascade do |t|
    t.integer "domain_id",                 null: false
    t.string  "name",        limit: 255,   null: false
    t.string  "type",        limit: 10,    null: false
    t.integer "modified_at",               null: false
    t.string  "account",     limit: 40
    t.string  "comment",     limit: 65535, null: false
  end

  add_index "comments", ["domain_id", "modified_at"], name: "comments_order_idx"
  add_index "comments", ["domain_id"], name: "comments_domain_id_index"
  add_index "comments", ["name", "type"], name: "comments_nametype_index"

# Could not dump table "cryptokeys" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "domainmetadata", force: :cascade do |t|
    t.integer "domain_id",            null: false
    t.string  "kind",      limit: 32
    t.text    "content"
  end

  add_index "domainmetadata", ["domain_id"], name: "domainmetaidindex"

  create_table "domains", force: :cascade do |t|
    t.string  "name",            limit: 255, null: false
    t.string  "master",          limit: 128
    t.integer "last_check"
    t.string  "type",            limit: 6,   null: false
    t.integer "notified_serial"
    t.string  "account",         limit: 40
  end

  add_index "domains", ["name"], name: "name_index", unique: true

# Could not dump table "records" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "supermasters", id: false, force: :cascade do |t|
    t.string "ip",         limit: 64,  null: false
    t.string "nameserver", limit: 255, null: false
    t.string "account",    limit: 40,  null: false
  end

  add_index "supermasters", ["ip", "nameserver"], name: "ip_nameserver_pk", unique: true

  create_table "tsigkeys", force: :cascade do |t|
    t.string "name",      limit: 255
    t.string "algorithm", limit: 50
    t.string "secret",    limit: 255
  end

  add_index "tsigkeys", ["name", "algorithm"], name: "namealgoindex", unique: true

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
