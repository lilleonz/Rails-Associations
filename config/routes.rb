Rails.application.routes.draw do
  get 'attendances/create'
  get 'attendances/destroy'
  root "events#index"

  resources :users, only: [:new, :create, :show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/show', to: 'users#show'

  resources :sessions, only: :create

  get '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :events

  match '/newpost', to: 'events#new', via: 'get'

  resources :attendances, only: [:create, :destroy]

end
