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

ActiveRecord::Schema.define(version: 20141119110035) do

  create_table "meta_values", force: true do |t|
    t.integer "story_id"
    t.text    "meta_type"
    t.text    "meta_value"
  end

  add_index "meta_values", ["story_id"], name: "index_meta_values_on_story_id"

  create_table "stories", force: true do |t|
    t.text     "guid"
    t.text     "link"
    t.text     "title"
    t.text     "description"
    t.text     "body"
    t.text     "largeimage"
    t.text     "smallimage"
    t.text     "video"
    t.text     "source"
    t.text     "pubDate"
    t.text     "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["guid"], name: "index_stories_on_guid", unique: true

end
