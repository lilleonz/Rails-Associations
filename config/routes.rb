Rails.application.routes.draw do
  get 'attendances/create'
  get 'attendances/destroy'
  root "events#index"

  resources :users, only: :show

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :sessions, only: :create

  get '/signin',  to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :events

  match '/newpost', to: 'events#new', via: 'get'

  resources :attendances, only: [:create, :destroy]
  post '/attend',  to: 'attendances#create'
  delete '/unattend', to: 'attendances#destroy'
end
