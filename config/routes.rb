Rails.application.routes.draw do

  root to: "users#new" 

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # get '/<%= current_user.username %>'


  resources :users

end
