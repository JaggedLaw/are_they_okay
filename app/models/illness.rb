class Illness < ActiveRecord::Base
  belongs_to :user
  has_many :illness_questions
  has_many :questions, through: :illness_questions
  has_many :symptoms
end
