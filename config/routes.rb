Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users
  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'
end
