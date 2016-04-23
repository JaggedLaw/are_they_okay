class CreateIllnessQuestions < ActiveRecord::Migration
  def change
    create_table :illness_questions do |t|
      t.references :illness, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :weight

      t.timestamps null: false
    end
  end
end
