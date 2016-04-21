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

ActiveRecord::Schema.define(version: 20160420235641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.text   "bio"
  end

  create_table "cards", force: :cascade do |t|
    t.string  "name",           null: false
    t.string  "color_identity", null: false
    t.string  "mana_cost"
    t.integer "cmc",            null: false
    t.text    "rules_text"
    t.text    "flavor_text"
    t.integer "power"
    t.integer "toughness"
    t.integer "loyalty"
    t.integer "artist_id"
    t.integer "number"
    t.text    "image"
    t.integer "type_id"
    t.integer "supertype_id"
    t.integer "subtype_id"
    t.integer "expantion_id"
    t.integer "rarity_id"
  end

  create_table "expantions", force: :cascade do |t|
    t.string  "name",   null: false
    t.text    "symbol"
    t.integer "total"
  end

  create_table "rarities", force: :cascade do |t|
    t.string "value"
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "sbtypname"
  end

  create_table "supertypes", force: :cascade do |t|
    t.string "sptypname"
  end

  create_table "types", force: :cascade do |t|
    t.string "typname"
  end

end
