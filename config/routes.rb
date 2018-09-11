Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/login', to: 'login#index'

  resources :heros, only: [:create, :index]

  resources :users, only: [:create, :new, :show] do
    get '/recent_games', to: 'recent_games#show'
  end
  resources :sessions, only: [:create, :destroy]
  get '/hero-matchups', to: 'matchups#index'
end
