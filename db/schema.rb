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

ActiveRecord::Schema.define(version: 20141018185101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "abilities", force: true do |t|
    t.string "name"
    t.text   "trigger"
    t.text   "effect"
    t.string "type",    null: false
    t.hstore "cost"
  end

  create_table "abilities_cards", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "ability_id"
  end

  add_index "abilities_cards", ["ability_id"], name: "index_abilities_cards_on_ability_id", using: :btree
  add_index "abilities_cards", ["card_id"], name: "index_abilities_cards_on_card_id", using: :btree

  create_table "card_sets", force: true do |t|
    t.string   "name",       null: false
    t.string   "block"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_sets_formats", id: false, force: true do |t|
    t.integer "card_set_id"
    t.integer "format_id"
  end

  add_index "card_sets_formats", ["card_set_id"], name: "index_card_sets_formats_on_card_set_id", using: :btree
  add_index "card_sets_formats", ["format_id"], name: "index_card_sets_formats_on_format_id", using: :btree

  create_table "cards", force: true do |t|
    t.string   "name",          null: false
    t.hstore   "mana_cost"
    t.string   "colors",        null: false, array: true
    t.string   "rarity",        null: false
    t.integer  "power"
    t.integer  "toughness"
    t.boolean  "dual_card"
    t.integer  "card_set_id",   null: false
    t.integer  "type_id",       null: false
    t.integer  "supertype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_class_id"
  end

  add_index "cards", ["card_set_id"], name: "index_cards_on_card_set_id", using: :btree
  add_index "cards", ["supertype_id"], name: "index_cards_on_supertype_id", using: :btree
  add_index "cards", ["type_class_id"], name: "index_cards_on_type_class_id", using: :btree
  add_index "cards", ["type_id"], name: "index_cards_on_type_id", using: :btree

  create_table "cards_decks", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "deck_id"
  end

  add_index "cards_decks", ["card_id"], name: "index_cards_decks_on_card_id", using: :btree
  add_index "cards_decks", ["deck_id"], name: "index_cards_decks_on_deck_id", using: :btree

  create_table "cards_subtypes", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "subtype_id"
  end

  add_index "cards_subtypes", ["card_id"], name: "index_cards_subtypes_on_card_id", using: :btree
  add_index "cards_subtypes", ["subtype_id"], name: "index_cards_subtypes_on_subtype_id", using: :btree

  create_table "decks", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "formats", force: true do |t|
    t.string "name",          null: false
    t.string "illegal_cards",              array: true
  end

  create_table "subtypes", force: true do |t|
    t.string "name", null: false
  end

  create_table "supertypes", force: true do |t|
    t.string "name", null: false
  end

  create_table "type_classes", force: true do |t|
    t.string "name", null: false
  end

  create_table "types", force: true do |t|
    t.string  "name",      null: false
    t.boolean "permanent", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  limit: nil, default: "", null: false
    t.string   "encrypted_password",     limit: nil, default: "", null: false
    t.string   "reset_password_token",   limit: nil
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",     limit: nil
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: nil
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token",           limit: nil
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: nil
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
