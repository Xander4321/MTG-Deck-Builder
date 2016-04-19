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

ActiveRecord::Schema.define(version: 20160417160047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string  "name",           null: false
    t.string  "color_identity", null: false
    t.string  "mana_cost"
    t.integer "cmc",            null: false
    t.string  "rarity",         null: false
    t.text    "rules_text"
    t.text    "flavor_text"
    t.integer "power"
    t.integer "toughness"
    t.integer "loyalty"
    t.integer "artist_id_id"
    t.integer "number"
    t.text    "image"
  end

end