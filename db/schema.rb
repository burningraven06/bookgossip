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

ActiveRecord::Schema.define(version: 20161023095840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "bio"
    t.string   "avatar"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "default_avatar"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.date     "publication_date"
    t.string   "cover_page"
    t.string   "book_summary"
    t.integer  "author_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "cover_page_file_name"
    t.string   "cover_page_content_type"
    t.integer  "cover_page_file_size"
    t.datetime "cover_page_updated_at"
    t.boolean  "default_avatar"
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
    t.index ["id"], name: "index_books_on_id", using: :btree
  end

  create_table "books_genres", force: :cascade do |t|
    t.integer "book_id"
    t.integer "genre_id"
    t.index ["book_id"], name: "index_books_genres_on_book_id", using: :btree
    t.index ["genre_id"], name: "index_books_genres_on_genre_id", using: :btree
  end

  create_table "books_reviews", force: :cascade do |t|
    t.integer "book_id"
    t.integer "review_id"
    t.index ["book_id"], name: "index_books_reviews_on_book_id", using: :btree
    t.index ["review_id"], name: "index_books_reviews_on_review_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "cover_page"
    t.string   "cover_page_file_name"
    t.string   "cover_page_content_type"
    t.integer  "cover_page_file_size"
    t.datetime "cover_page_updated_at"
    t.boolean  "default_avatar"
  end

  create_table "group_user_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "request_approved"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["group_id"], name: "index_group_user_requests_on_group_id", using: :btree
    t.index ["user_id"], name: "index_group_user_requests_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.integer  "member_count"
    t.integer  "post_count"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "cover_page_file_name"
    t.string   "cover_page_content_type"
    t.integer  "cover_page_file_size"
    t.datetime "cover_page_updated_at"
    t.boolean  "default_avatar"
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.boolean "request_approved"
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.string   "cover_page"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "cover_page_file_name"
    t.string   "cover_page_content_type"
    t.integer  "cover_page_file_size"
    t.datetime "cover_page_updated_at"
    t.boolean  "default_avatar"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "heading"
    t.string   "review"
    t.integer  "book_id"
    t.string   "status"
    t.date     "publication_date"
    t.boolean  "default_avatar"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "cover_page_file_name"
    t.string   "cover_page_content_type"
    t.integer  "cover_page_file_size"
    t.datetime "cover_page_updated_at"
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "topic_replies", force: :cascade do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_topic_replies_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_topic_replies_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "heading"
    t.string   "body"
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "default_avatar"
    t.integer  "reply_count"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "topic_icon_file_name"
    t.string   "topic_icon_content_type"
    t.integer  "topic_icon_file_size"
    t.datetime "topic_icon_updated_at"
    t.index ["group_id"], name: "index_topics_on_group_id", using: :btree
    t.index ["user_id"], name: "index_topics_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.string   "string"
    t.string   "email"
    t.string   "password_digest"
    t.string   "date_of_birth"
    t.string   "gender"
    t.string   "account_type"
    t.string   "avatar"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "show_birthday_status"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "account_confirmed"
    t.string   "account_confirmation_token"
    t.boolean  "default_avatar"
  end

  add_foreign_key "topics", "groups"
  add_foreign_key "topics", "users"
end
