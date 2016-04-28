
ActiveRecord::Schema.define(version: 20160425053327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "illness_questions", force: :cascade do |t|
    t.integer  "illness_id"
    t.integer  "question_id"
    t.integer  "weight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "illness_questions", ["illness_id"], name: "index_illness_questions_on_illness_id", using: :btree
  add_index "illness_questions", ["question_id"], name: "index_illness_questions_on_question_id", using: :btree

  create_table "illnesses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "illnesses", ["user_id"], name: "index_illnesses_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.integer  "illness_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "symptoms", ["illness_id"], name: "index_symptoms_on_illness_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "users"
  add_foreign_key "illness_questions", "illnesses"
  add_foreign_key "illness_questions", "questions"
  add_foreign_key "illnesses", "users"
  add_foreign_key "symptoms", "illnesses"
end
