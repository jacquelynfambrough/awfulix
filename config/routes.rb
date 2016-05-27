Rails.application.routes.draw do
  root to: 'users#index'
  #user routes
  get '/users/new', to: 'users#new', as: 'new_user'
  #sessions routes
  get '/login', to: 'sessions#new', as: 'new_session'
  #movie routes

  #review routes
end
