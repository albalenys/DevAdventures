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

ActiveRecord::Schema.define(version: 20160427035013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "content",                    null: false
    t.integer  "admin_id",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "private",    default: false
  end

  add_index "posts", ["admin_id"], name: "index_posts_on_admin_id", using: :btree
  add_index "posts", ["private"], name: "index_posts_on_private", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "url"
    t.text     "description"
    t.string   "software"
    t.integer  "admin_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "github"
  end

  add_index "projects", ["admin_id"], name: "index_projects_on_admin_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resources", ["post_id"], name: "index_resources_on_post_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
