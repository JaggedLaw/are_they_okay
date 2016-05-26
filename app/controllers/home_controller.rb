class HomeController < ApplicationController
  def index
    if Question.exists?
      $start_question = rand(Question.first.id..Question.last.id)
    else
      $start_question = 1
    end
  end
end
