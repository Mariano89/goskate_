Rails.application.routes.draw do

  root to: "users#new" 

  resources :users

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
