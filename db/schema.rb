# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2013_04_11_095908) do
  create_table "articles", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "body"
    t.integer "user_id"
    t.text "excerpt"
    t.string "permalink", limit: 255
    t.string "uuid", limit: 255
    t.boolean "draft", default: true
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "text_filter", limit: 255
    t.string "url", limit: 255
    t.boolean "link_article"
  end

  create_table "articles_tags", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "tag_id"
    t.index ["article_id", "tag_id"], name: "index_articles_tags_on_article_id_and_tag_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "paperclip_file_name", limit: 255
    t.integer "paperclip_file_size"
    t.string "paperclip_content_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "paperclip_updated_at"
    t.index ["paperclip_file_name"], name: "index_documents_on_paperclip_file_name_and_extension", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "body"
    t.integer "user_id"
    t.string "permalink", limit: 255
    t.boolean "draft", default: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "hidden", default: false
    t.string "text_filter", limit: 255
    t.integer "sort_order", default: 0
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "human_readable", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "resource", limit: 255
    t.string "key", limit: 255
    t.text "value", limit: 255
    t.boolean "hidden", default: false
    t.string "human_readable", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "required", default: false
    t.string "field_type", limit: 255
    t.index ["resource", "key"], name: "index_settings_on_resource_and_key", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255
    t.string "crypted_password", limit: 255
    t.string "password_salt", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "role_id"
    t.string "website", limit: 255
    t.index ["username"], name: "index_users_on_username", unique: true
  end
end
