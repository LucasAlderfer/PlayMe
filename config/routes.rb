Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :heros, only: [:create, :index]

  resources :users, only: [:create, :new, :show, :update] do
    get '/recent_games', to: 'recent_games#show'
    get '/settings', to: 'settings#show'
  end
  get '/explanations', to: 'explanations#show'
  get '/hero-matchups', to: 'matchups#index'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
