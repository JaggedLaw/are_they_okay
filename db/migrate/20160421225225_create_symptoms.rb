class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.references :illness, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
