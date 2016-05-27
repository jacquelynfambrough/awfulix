Rails.application.routes.draw do
  root to: 'users#index'
  #user routes
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users/create', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update' 
  delete '/users/:id', to: 'users#destroy'

  #sessions routes
  get '/login', to: 'sessions#new', as: 'new_session'

  #movie routes

  #review routes
end
