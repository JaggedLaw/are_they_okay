class EpisodesController < ApplicationController

  def related_episodes
    render json: ApiService.new.grab_related_episodes(params)
    # make an episode class with attributes i want displayed
    # episode collector service
  end

end
