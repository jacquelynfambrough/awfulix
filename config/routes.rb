Rails.application.routes.draw do
  root to: 'users#index'
  #user routes
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  #sessions routes
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/sessions', to: 'sessions#create', as: 'new_session'

  #movie routes
  get '/movies', to: 'movies#index', as: 'movies'
  post '/movies', to: 'movies#create', as: 'create_movie'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  #review routes
end
