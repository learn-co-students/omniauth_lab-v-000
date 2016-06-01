Rails.application.routes.draw do
  root 'welcome#home'

  resources :sessions, only: [:new, :create, :destroy]
  get '/auth/facebook/callback' => 'sessions#create'
end
