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

ActiveRecord::Schema.define(version: 20160515224036) do

  create_table "countries", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "year",        limit: 4
    t.string   "rated",       limit: 255
    t.date     "released"
    t.integer  "runtime",     limit: 4
    t.integer  "genre_id",    limit: 4
    t.text     "plot",        limit: 65535
    t.integer  "country_id",  limit: 4
    t.integer  "metascore",   limit: 4
    t.integer  "imdb_rating", limit: 4
    t.integer  "imdb_votes",  limit: 4
    t.string   "source",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "movies", ["country_id"], name: "index_movies_on_country_id", using: :btree
  add_index "movies", ["genre_id"], name: "index_movies_on_genre_id", using: :btree

  create_table "movies_people", id: false, force: :cascade do |t|
    t.integer "movie_id",  limit: 4, null: false
    t.integer "person_id", limit: 4, null: false
  end

  add_index "movies_people", ["movie_id", "person_id"], name: "index_movies_people_on_movie_id_and_person_id", using: :btree
  add_index "movies_people", ["person_id", "movie_id"], name: "index_movies_people_on_person_id_and_movie_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "movies", "countries"
  add_foreign_key "movies", "genres"
end
