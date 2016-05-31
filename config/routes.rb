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
  get '/movies/new', to: 'movies#new', as: 'new_movie'
  post '/movies', to: 'movies#create'
  get '/movies/:id/edit', to: 'movies#edit', as: 'edit_movie'
  patch '/movies/:id', to: 'movies#update'
  # delete '/movies/:id', to: 'movies#destroy', as: 'delete_movie'
  #review routes
end
