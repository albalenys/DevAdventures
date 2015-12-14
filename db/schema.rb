ActiveRecord::Schema.define(version: 20151214234730) do
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "admin_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "resources", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
