class SurveysController < ApplicationController
  def index
    @questions = Question.all
  end
end
