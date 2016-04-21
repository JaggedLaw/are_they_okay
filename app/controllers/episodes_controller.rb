class EpisodesController < ApplicationController

  def show
    render json: ApiService.new.grab_show(params)
  end

  def related_episodes
    render json: ApiService.new.grab_related_episodes(params)
  end

end
