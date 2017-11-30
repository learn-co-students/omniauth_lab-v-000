Rails.application.routes.draw do
  root 'welcome#home'

  get 'auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # get '/login' => 'session#new'
  # post '/login' => 'session#create'
  #
  # get '/signup' => 'user#new'
  # post '/signup' => 'user#create'
end
