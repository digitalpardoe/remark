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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110320092408) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.text     "excerpt"
    t.string   "permalink"
    t.string   "uuid"
    t.boolean  "draft",        :default => true
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text_filter"
  end

  create_table "articles_tags", :id => false, :force => true do |t|
    t.string  "article_id"
    t.boolean "tag_id"
  end

  add_index "articles_tags", ["article_id", "tag_id"], :name => "index_articles_tags_on_article_id_and_tag_id"

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.string   "website"
    t.string   "uuid"
    t.boolean  "spam",       :default => true
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "extension"
    t.integer  "size"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["name", "extension"], :name => "index_documents_on_name_and_extension", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.string   "permalink"
    t.boolean  "draft",        :default => false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",       :default => false
    t.string   "text_filter"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "human_readable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "settings", :force => true do |t|
    t.string   "resource"
    t.string   "key"
    t.string   "value"
    t.boolean  "hidden",         :default => false
    t.string   "human_readable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "required",       :default => false
    t.string   "field_type"
  end

  add_index "settings", ["resource", "key"], :name => "index_settings_on_resource_and_key", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "text_filters", :force => true do |t|
    t.string   "name"
    t.string   "human_readable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_filters", ["name"], :name => "index_text_filters_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "website"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
