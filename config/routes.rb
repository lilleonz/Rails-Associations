Rails.application.routes.draw do
  root "events#index"
  resources :user, only: [:new, :create, :show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/show', to: 'users#show'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new', via: 'get'
  delete '/signout', to: 'sessions#destroy'
  resources :events
end