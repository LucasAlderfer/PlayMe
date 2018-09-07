Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/login', to: 'login#index'

  resources :users, only: [:create, :new, :show] do
    get '/recent_games', to: 'recent_games#show'
  end
  get '/sessions', to: 'sessions#create'
end
