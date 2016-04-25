class AnswersController < ApplicationController
  def new
  end

  def create
    @answer = current_user.answers.create(answer: params[:answer][:answer])
    @counter = params[:answer][:counter].to_i + 1
    redirect_to survey_path(@counter)
  end
end
