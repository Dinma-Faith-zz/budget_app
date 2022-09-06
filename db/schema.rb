ActiveRecord::Schema[7.0].define(version: 2022_09_03_155824) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_records", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_records_on_group_id"
    t.index ["record_id"], name: "index_group_records_on_record_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "group_records", "groups"
  add_foreign_key "group_records", "records"
  add_foreign_key "groups", "users"
  add_foreign_key "records", "users"
end
