Rails.application.routes.draw do
  get 'attendances/create'
  get 'attendances/destroy'
  root 'events#index'

  resources :users, only: [:new, :create, :show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/show', to: 'users#show'

  resources :sessions, only: [:new, :create, :destroy]

  match '/signin', to: 'sessions#new', via: 'get'
  delete '/signout', to: 'sessions#destroy'

  resources :events

  match '/newpost', to: 'events#new', via: 'get'

  resources :attendances, only: [:create, :destroy]

  match '/attend', to: 'attendances#create', via: 'post'
  match '/unattend', to: 'attendances#destroy', via: 'delete'
end
