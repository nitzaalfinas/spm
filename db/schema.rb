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

ActiveRecord::Schema.define(version: 20150110005138) do

  create_table "bidangs", force: :cascade do |t|
    t.string   "nama_bidang", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indikators", force: :cascade do |t|
    t.integer  "bidang_id",      limit: 4
    t.integer  "sub_bidang_id",  limit: 4
    t.string   "nama_indikator", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jenis_pelayanans", force: :cascade do |t|
    t.integer  "bidang_id",            limit: 4
    t.string   "jenis_pelayanan_nama", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "kabkots", force: :cascade do |t|
    t.integer  "provinsi_id", limit: 4
    t.integer  "kabkot_id",   limit: 4
    t.string   "kabkot_nama", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nilai_indikators", force: :cascade do |t|
    t.integer  "indikator_id", limit: 4
    t.integer  "provinsi_id",  limit: 4
    t.integer  "kabkot_id",    limit: 4
    t.integer  "target",       limit: 4
    t.integer  "capaian",      limit: 4
    t.integer  "gap",          limit: 4
    t.integer  "tahun",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinsis", force: :cascade do |t|
    t.integer  "provinsi_id",   limit: 4
    t.string   "provinsi_nama", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_bidangs", force: :cascade do |t|
    t.integer  "bidang_id",       limit: 4
    t.string   "nama_sub_bidang", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
