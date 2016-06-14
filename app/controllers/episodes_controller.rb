class EpisodesController < ApplicationController

  def index
    if params[:illnesses]
      @episodes = ApiService.new.grab_related_episodes(params)
    else
      flash["alert-info"] = "You don't have any results to search!"
      redirect_to results_path
    end
  end

  def related_episodes
    render json: ApiService.new.print_related_episodes(params)
  end

end
