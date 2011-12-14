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

ActiveRecord::Schema.define(:version => 20111214185402) do

  create_table "cards", :force => true do |t|
    t.string  "rank"
    t.string  "suit"
    t.integer "deck_id"
    t.integer "hand_id"
  end

  add_index "cards", ["deck_id"], :name => "index_cards_on_deck_id"

  create_table "decks", :force => true do |t|
    t.integer "game_id"
  end

  add_index "decks", ["game_id"], :name => "index_decks_on_game_id"

  create_table "games", :force => true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.string   "game_phase"
    t.integer  "whos_turn"
    t.string   "player1_hand"
    t.string   "player2_hand"
    t.string   "crib"
    t.integer  "player1_score"
    t.integer  "player2_score"
    t.string   "cut"
    t.string   "player1_cards_played"
    t.string   "player2_cards_played"
    t.integer  "whos_crib"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["player1_id", "player2_id"], :name => "index_games_on_player1_id_and_player2_id"

  create_table "games_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  add_index "games_users", ["game_id", "user_id"], :name => "index_games_users_on_game_id_and_user_id"

  create_table "hands", :force => true do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
