Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :heros, only: [:create, :index]

  resources :users, only: [:create, :new, :show, :update] do
    get '/settings', to: 'settings#show'
  end
  get '/dashboard', to: 'users#show'
  get '/explanations', to: 'explanations#show'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
