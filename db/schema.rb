# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_08_150140) do
  create_table "blocks", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "block_id", null: false
    t.integer "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course_title"
    t.index ["block_id"], name: "index_meetings_on_block_id"
    t.index ["classroom_id"], name: "index_meetings_on_classroom_id"
    t.index ["teacher_id"], name: "index_meetings_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
  end

  add_foreign_key "meetings", "blocks"
  add_foreign_key "meetings", "classrooms"
  add_foreign_key "meetings", "teachers"
  add_foreign_key "teachers", "departments"
end
