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

ActiveRecord::Schema.define(version: 20161210143853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "writer"
    t.string   "reader"
    t.integer  "user_id"
    t.integer  "famorg_id"
  end

  create_table "famorg_comments", force: :cascade do |t|
    t.integer  "famorg_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_famorg_comments_on_comment_id", using: :btree
    t.index ["famorg_id"], name: "index_famorg_comments_on_famorg_id", using: :btree
  end

  create_table "famorgs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.boolean  "santas_assigned",                         default: false, null: false
    t.date     "date"
    t.decimal  "cost",            precision: 5, scale: 2
  end

  create_table "season_famorgs", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "famorg_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "santas_assigned", default: false, null: false
    t.index ["famorg_id"], name: "index_season_famorgs_on_famorg_id", using: :btree
    t.index ["season_id"], name: "index_season_famorgs_on_season_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.date     "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "st_nicks", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_st_nicks_on_user_id", using: :btree
  end

  create_table "user_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_user_comments_on_comment_id", using: :btree
    t.index ["user_id"], name: "index_user_comments_on_user_id", using: :btree
  end

  create_table "user_famorgs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "famorg_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "admin",      default: false, null: false
    t.integer  "santa_id"
    t.index ["famorg_id"], name: "index_user_famorgs_on_famorg_id", using: :btree
    t.index ["user_id"], name: "index_user_famorgs_on_user_id", using: :btree
  end

  create_table "user_seasons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_user_seasons_on_season_id", using: :btree
    t.index ["user_id"], name: "index_user_seasons_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_image_id"
    t.string   "want"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "santa"
    t.boolean  "admin",                  default: false, null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "famorg_comments", "comments"
  add_foreign_key "famorg_comments", "famorgs"
  add_foreign_key "season_famorgs", "famorgs"
  add_foreign_key "season_famorgs", "seasons"
  add_foreign_key "st_nicks", "users"
  add_foreign_key "user_comments", "comments"
  add_foreign_key "user_comments", "users"
  add_foreign_key "user_famorgs", "famorgs"
  add_foreign_key "user_famorgs", "users"
  add_foreign_key "user_seasons", "seasons"
  add_foreign_key "user_seasons", "users"
end
