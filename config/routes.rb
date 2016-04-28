  Rails.application.routes.draw do

  get 'sessions/create'

  root 'home#index'

  get "/auth/tumblr", as: "tumblr_login"
  get "/auth/tumblr/callback", to: "sessions#create"

  delete '/logout', to: "sessions#destroy"

  resources :episodes do
    collection do
      get "/related", to: "episodes#related_episodes"
    end
  end

  resources :surveys, only: [:show]

  resources :answers, only: [:new, :create]

  resources :results, only: [:index]

end
