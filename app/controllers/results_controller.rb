class ResultsController < ApplicationController

  def index
    @illnesses = Answer.find_illnesses
  end

end
