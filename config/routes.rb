Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#new"
  resources :user, only: [:new, :create, :show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/show', to: 'users#show'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new', via: 'get'
  delete '/signout', to: 'sessions#destroy'
end
