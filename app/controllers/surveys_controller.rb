class SurveysController < ApplicationController

  def show
    if (params[:id].to_i) <= Question.count
      @question = Question.find(params[:id])
      @answers = Answer.new
    end
  end
end
