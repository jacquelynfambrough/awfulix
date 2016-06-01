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

  #movie review routes
  get '/reviews', to: 'reviews#index', as: 'reviews'
  get '/movies/:id', to:'reviews#index', as: 'movie_reviews'
  post '/movies/:id', to: 'reviews#create', as: 'create_review'
  get '/movies/:id/reviews/new', to:'reviews#new', as: 'new_review'
  get '/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  patch '/movies/:id', to: 'reviews#update', as: 'update_review'
  delete '/movies/:id', to: 'reviews#destroy', as: 'delete_review'

end
