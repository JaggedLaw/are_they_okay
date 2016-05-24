class EpisodesController < ApplicationController

  def index
    @episodes = ApiService.new.grab_related_episodes(params)
  end

  def related_episodes
    render json: ApiService.new.print_related_episodes(params)
  end

  def show
    @episode = ApiService.new.grab_episode(params)
    @episode_link = @episode[:urls][:ui]
  end
end
