class SurveysController < ApplicationController

  def show
    if (params[:id].to_i) <= Question.last.id
      @question = Question.find(params[:id])
      @answers = Answer.new
    else
      redirect_to results_path
    end
  end
end
