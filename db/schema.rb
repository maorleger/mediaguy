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

ActiveRecord::Schema.define(version: 20160515001714) do

  create_table "actors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "movie_id", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "directors_movies", id: false, force: :cascade do |t|
    t.integer "director_id", null: false
    t.integer "movie_id",    null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "rated"
    t.date     "released"
    t.integer  "runtime"
    t.integer  "genre_id"
    t.text     "plot"
    t.integer  "country_id"
    t.integer  "metascore"
    t.integer  "ImdbRating"
    t.integer  "ImdbVotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
  end

  add_index "movies", ["country_id"], name: "index_movies_on_country_id"
  add_index "movies", ["genre_id"], name: "index_movies_on_genre_id"

  create_table "movies_writers", id: false, force: :cascade do |t|
    t.integer "movie_id",  null: false
    t.integer "writer_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
