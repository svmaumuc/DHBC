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

ActiveRecord::Schema.define(version: 20140708063951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cauhois", id: false, force: true do |t|
    t.integer "ID",         null: false
    t.integer "TheLoai_ID"
    t.string  "DapAn"
    t.string  "DapAnCoDau"
    t.integer "MucDo"
  end

  create_table "hinhanhs", id: false, force: true do |t|
    t.integer "ID",        null: false
    t.string  "Link"
    t.integer "CauHoi_ID"
  end

  create_table "lichsus", id: false, force: true do |t|
    t.integer "ID",                null: false
    t.integer "CauHoiDaTraLoi_ID"
    t.integer "NguoiChoi_ID"
    t.integer "SoLanTraLoiSai"
    t.integer "ThoiGian"
  end

  create_table "nguoichois", id: false, force: true do |t|
    t.integer "ID",      null: false
    t.string  "Ten"
    t.integer "NamSinh"
    t.string  "LinkFB"
    t.integer "Diem"
  end

  create_table "theloais", id: false, force: true do |t|
    t.integer "ID",                     null: false
    t.string  "TenTheLoai", limit: nil
  end

end
