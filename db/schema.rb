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

ActiveRecord::Schema.define(version: 20150320080419) do

  create_table "dapils", force: true do |t|
    t.string "dapil_id"
    t.string "nama"
    t.string "jumlah_kursi"
  end

  create_table "parties", force: true do |t|
    t.string "nama"
    t.string "nama_lengkap"
    t.string "url_situs"
    t.string "url_facebook"
    t.string "url_twitter"
    t.string "url_logo_mini"
    t.string "url_logo_small"
    t.string "url_logo_medium"
  end

  create_table "perolehan_suaras", force: true do |t|
    t.string "dapil_id"
    t.string "party_id"
    t.string "jumlah"
  end

  add_index "perolehan_suaras", ["dapil_id", "party_id"], name: "index_perolehan_suaras_on_dapil_id_and_party_id", using: :btree

end
