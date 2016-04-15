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

ActiveRecord::Schema.define(version: 20160328104944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"
  enable_extension "uuid-ossp"

  create_table "issues", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "project_id",                    null: false
    t.string   "summary",                       null: false
    t.text     "description", default: "",      null: false
    t.datetime "created_at",  default: "now()", null: false
    t.datetime "updated_at",  default: "now()", null: false
    t.integer  "no",                            null: false
  end

  add_index "issues", ["project_id", "no"], name: "index_issues_on_project_id_and_no", unique: true, using: :btree

  create_table "projects", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "key",                           null: false
    t.string   "name",                          null: false
    t.text     "description", default: "",      null: false
    t.datetime "created_at",  default: "now()", null: false
    t.datetime "updated_at",  default: "now()", null: false
    t.text     "seq",                           null: false
    t.text     "lead",                          null: false
  end

  add_index "projects", ["key", "name"], name: "index_projects_on_key_and_name", unique: true, using: :btree
  add_index "projects", ["key"], name: "index_projects_on_key", unique: true, using: :btree

  add_foreign_key "issues", "projects", on_delete: :cascade
  add_foreign_key "projects", "basic_auth.users", column: "lead", primary_key: "email", name: "projects_lead_fkey", on_update: :cascade, on_delete: :restrict
end
