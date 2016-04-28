require 'csv'

namespace :import do

  desc "Import models from csv"
    task import_csv: :environment do

      counter = 0
      filename = "lib/assets/illnesses.csv"
      CSV.foreach(filename, :headers => true) do |row|
        id, name = row
        Illness.create!(row.to_h)
        counter += 1
      end
      puts "Imported #{counter} disorders"

      counter = 0
      filename = "lib/assets/illness_questions.csv"
      CSV.foreach(filename, :headers => true) do |row|
        illness_id, question_id, weight = row
        IllnessQuestion.create!(row.to_h)
        counter += 1
      end
      puts "Imported #{counter} illness_questions"


  end

end
