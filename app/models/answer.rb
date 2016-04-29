class Answer < ActiveRecord::Base
  #make association that answer belongs to a question
  belongs_to :user
  belongs_to :question

  def self.find_illnesses
    binding.pry
    data = self.where(answer: "Yes")

  end

end
