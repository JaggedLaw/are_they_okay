class Illness < ActiveRecord::Base
  belongs_to :user
  has_many :illness_questions
  has_many :questions, through: :illness_questions
  has_many :symptoms

  def self.find_illnesses
    yes_questions = Question.joins(:answers).where(answers: {answer: "Yes"})
    illnesses_answered_yes = Illness.joins(illness_questions: :question).merge(yes_questions)
    illness_ids = illnesses_answered_yes.pluck(:id)
    filtered_illness_questions = IllnessQuestion.where(illness_id: illness_ids)

    final_hash = Hash.new
    filtered_illness_questions.each do |object|
      hash_key = object[:illness_id]
      if final_hash.keys.include?(hash_key)
        final_hash[hash_key] = final_hash[hash_key] + object[:weight]
      else
        final_hash[hash_key] = object[:weight]
      end
    end
    return final_hash
  end
end
