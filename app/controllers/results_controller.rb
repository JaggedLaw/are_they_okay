class ResultsController < ApplicationController

  def index
    @illnesses = Illness.find_illnesses
  end

end
