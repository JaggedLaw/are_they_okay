class Answer < ActiveRecord::Base
  #make association that answer belongs to a question
  belongs_to :user
  belongs_to :question

  def self.yes_answers

    where(answer: "Yes")
    # yes_answers = self.where(answer: "Yes")
    # questions = Array.new
    # weight = 0
    #
    # yes_answers.joins(:question)
    # data = Answer.joins(:question).where(answer: "Yes")
    # binding.pry
    # data.each do |answer|
    #   questions << Question.find(answer.question_id)
    # end
    # questions.each do |question|
    #
    #   illness_hash =
    #   # weight += IllnessQuestion.find(question.id).weight
    #
    #   binding.pry
    # end

    # find answer where Yes
    # find related question
    # find the related weights
    # and find to related illnesses
    # Question.first.illnesses
    # table = IllnessQuestion.joins(question: :answers).where(answer: "Yes").all
  end

end
