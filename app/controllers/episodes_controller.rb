class EpisodesController < ApplicationController

  respond_to :json

  def show
    render json: ApiService.new.show_episode
  end
end
