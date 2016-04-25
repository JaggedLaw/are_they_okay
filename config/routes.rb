Rails.application.routes.draw do

  get 'sessions/create'

  root 'home#index'

  get "/auth/tumblr", as: "tumblr_login"
  get "/auth/tumblr/callback", to: "sessions#create"

  resources :episodes, only: [:show] do
    collection do
      get "/related", to: "episodes#related_episodes"
    end
  end

  resources :surveys, only: [:index]


end
