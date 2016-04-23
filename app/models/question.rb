class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :illness_questions
  has_many :illnesses, through: :illness_questions

end
