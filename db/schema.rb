ActiveRecord::Schema.define(version: 2019_05_16_201424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.bigint "billboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billboard_id"], name: "index_artists_on_billboard_id"
  end

  create_table "billboards", force: :cascade do |t|
    t.string "top_100_us"
    t.string "top_100_eu"
    t.string "top_50_us"
    t.string "top_50_eu"
    t.string "top_10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.bigint "artist_id"
    t.bigint "billboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["billboard_id"], name: "index_songs_on_billboard_id"
  end

  add_foreign_key "artists", "billboards"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "billboards"
end
