Rails.application.routes.draw do

  root 'welcome#home'
  resources :sessions
  get '/auth/facebook/callback', to: 'sessions#create'
end
