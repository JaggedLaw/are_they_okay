require 'rails_helper'

RSpec.describe EpisodesController, type: :controller do

  describe "GET #related" do
    it "returns http success" do
      get :related_episodes
      # expect(response).to have_http_status(:success)
    end
  end

end
