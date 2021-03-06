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

ActiveRecord::Schema.define(version: 20160504034717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cdtopics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cdtopics_publications", id: false, force: :cascade do |t|
    t.integer "publication_id"
    t.integer "cdtopic_id"
  end

  add_index "cdtopics_publications", ["cdtopic_id"], name: "index_cdtopics_publications_on_cdtopic_id", using: :btree
  add_index "cdtopics_publications", ["publication_id"], name: "index_cdtopics_publications_on_publication_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "courses_offered"
    t.string   "course_number"
    t.string   "semester_offered"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "course_category"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "date"
    t.text     "desc"
    t.text     "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.string   "dept"
    t.text     "desc"
    t.text     "office"
    t.string   "phone_no"
    t.string   "email"
    t.integer  "research_interest_id"
    t.integer  "project_id"
    t.integer  "publication_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "uin"
  end

  create_table "faculties_projects", id: false, force: :cascade do |t|
    t.integer "publication_id"
    t.integer "faculty_id"
  end

  add_index "faculties_projects", ["faculty_id"], name: "index_faculties_projects_on_faculty_id", using: :btree
  add_index "faculties_projects", ["publication_id"], name: "index_faculties_projects_on_publication_id", using: :btree

  create_table "faculties_publications", force: :cascade do |t|
    t.integer "faculty_id"
    t.integer "publication_id"
  end

  create_table "faculties_research_interests", id: false, force: :cascade do |t|
    t.integer "faculty_id"
    t.integer "research_interest_id"
  end

  add_index "faculties_research_interests", ["faculty_id"], name: "index_faculties_research_interests_on_faculty_id", using: :btree
  add_index "faculties_research_interests", ["research_interest_id"], name: "index_faculties_research_interests_on_research_interest_id", using: :btree

  create_table "faculties_students", id: false, force: :cascade do |t|
    t.integer "faculty_id"
    t.integer "student_id"
  end

  add_index "faculties_students", ["faculty_id"], name: "index_faculties_students_on_faculty_id", using: :btree
  add_index "faculties_students", ["student_id"], name: "index_faculties_students_on_student_id", using: :btree

  create_table "focusareas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "focusareas_publications", id: false, force: :cascade do |t|
    t.integer "publication_id"
    t.integer "focusarea_id"
  end

  add_index "focusareas_publications", ["focusarea_id"], name: "index_focusareas_publications_on_focusarea_id", using: :btree
  add_index "focusareas_publications", ["publication_id"], name: "index_focusareas_publications_on_publication_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "sponsor"
    t.text     "desc"
    t.integer  "faculty_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_students", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "student_id"
  end

  add_index "projects_students", ["project_id"], name: "index_projects_students_on_project_id", using: :btree
  add_index "projects_students", ["student_id"], name: "index_projects_students_on_student_id", using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "name"
    t.text     "abstract"
    t.string   "keywords"
    t.integer  "faculty_id"
    t.integer  "student_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "publication_type"
  end

  create_table "publications_students", force: :cascade do |t|
    t.integer "publication_id"
    t.integer "student_id"
  end

  create_table "research_interests", force: :cascade do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  create_table "research_interests_students", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "research_interest_id"
  end

  add_index "research_interests_students", ["research_interest_id"], name: "index_research_interests_students_on_research_interest_id", using: :btree
  add_index "research_interests_students", ["student_id"], name: "index_research_interests_students_on_student_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "uin"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "dept"
    t.text     "desc"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "research_interest_id"
    t.integer  "project_id"
    t.integer  "publication_id"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "uin"
  end

end
