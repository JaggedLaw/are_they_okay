class EpisodesController < ApplicationController

  def related_episodes
    render json: ApiService.new.grab_related_episodes(params)
  end

end
