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

ActiveRecord::Schema.define(version: 20141029131359) do

  create_table "books", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,                                   null: false
    t.string   "isbn",        limit: 255
    t.string   "cover",       limit: 255,   default: "default-cover.png"
    t.string   "title",       limit: 255,                                 null: false
    t.text     "description", limit: 65535,                               null: false
    t.string   "author",      limit: 255,                                 null: false
    t.integer  "pages",       limit: 4,                                   null: false
    t.string   "genre",       limit: 255,                                 null: false
    t.boolean  "request",     limit: 1,                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "books_genres", id: false, force: :cascade do |t|
    t.integer "genre_id", limit: 4, null: false
    t.integer "book_id",  limit: 4, null: false
  end

  add_index "books_genres", ["book_id", "genre_id"], name: "index_books_genres_on_book_id_and_genre_id", unique: true, using: :btree
  add_index "books_genres", ["genre_id"], name: "index_books_genres_on_genre_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",        limit: 45,    null: false
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["name"], name: "index_genres_on_name", unique: true, using: :btree

  create_table "request_books", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_books", ["book_id"], name: "index_request_books_on_book_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.string   "username",            limit: 15,                null: false
    t.string   "fullname",            limit: 80,                null: false
    t.integer  "room",                limit: 4
    t.string   "hostel",              limit: 40
    t.text     "profile_picture",     limit: 65535,             null: false
    t.datetime "time_of_reg"
    t.string   "current_mess",        limit: 40
    t.string   "comment",             limit: 50
    t.string   "remember_token",      limit: 128
    t.string   "bgroup",              limit: 5
    t.integer  "contact",             limit: 8,     default: 0
    t.string   "email",               limit: 255
    t.string   "nick",                limit: 255
    t.string   "gender",              limit: 1
    t.string   "picaddress",          limit: 50
    t.datetime "updated_timestamp"
    t.text     "usertype",            limit: 65535
    t.integer  "notifications_count", limit: 4,     default: 0, null: false
    t.string   "typename",            limit: 40
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["username"], name: "UNIQUE", unique: true, using: :btree
  add_index "users", ["username"], name: "username", unique: true, using: :btree

end
