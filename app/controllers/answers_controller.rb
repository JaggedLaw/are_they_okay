class AnswersController < ApplicationController
  def new
  end

  def create
    @answer = current_user.answers.create(answer: params[:answer][:answer], question_id: params[:answer][:question_id])
    @counter = params[:answer][:question_id].to_i + 1
    redirect_to survey_path(@counter)
  end
end
