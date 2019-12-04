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

ActiveRecord::Schema.define(version: 2019_12_02_041828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blog_tags", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_tags_on_blog_id"
    t.index ["tag_id"], name: "index_blog_tags_on_tag_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "direct_message_groups", force: :cascade do |t|
    t.bigint "by_user_id"
    t.bigint "to_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["by_user_id"], name: "index_direct_message_groups_on_by_user_id"
    t.index ["to_user_id"], name: "index_direct_message_groups_on_to_user_id"
  end

  create_table "direct_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "direct_message_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "send_user_id"
    t.index ["direct_message_group_id"], name: "index_direct_messages_on_direct_message_group_id"
    t.index ["send_user_id"], name: "index_direct_messages_on_send_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "target_id"
    t.boolean "is_pending", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_id"], name: "index_friends_on_target_id"
    t.index ["user_id", "target_id"], name: "index_friends_on_user_id_and_target_id", unique: true
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "group_messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_messages_on_group_id"
    t.index ["user_id"], name: "index_group_messages_on_user_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_public", default: false, null: false
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.integer "type"
    t.string "by_name"
    t.string "link"
    t.boolean "is_read", default: false, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_information_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_user_tags_on_tag_id"
    t.index ["user_id"], name: "index_user_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.text "description"
    t.integer "age"
    t.integer "gender", default: 0, null: false
    t.integer "height"
    t.integer "weight"
    t.integer "figure", default: 0, null: false
    t.integer "muscle_mass"
    t.integer "body_fat_percentage"
    t.integer "seriousness", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "access_token"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_tags", "blogs"
  add_foreign_key "blog_tags", "tags"
  add_foreign_key "blogs", "users"
  add_foreign_key "direct_message_groups", "users", column: "by_user_id"
  add_foreign_key "direct_message_groups", "users", column: "to_user_id"
  add_foreign_key "direct_messages", "direct_message_groups"
  add_foreign_key "direct_messages", "users", column: "send_user_id"
  add_foreign_key "friends", "users"
  add_foreign_key "friends", "users", column: "target_id"
  add_foreign_key "group_messages", "groups"
  add_foreign_key "group_messages", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "information", "users"
  add_foreign_key "user_tags", "tags"
  add_foreign_key "user_tags", "users"
end
