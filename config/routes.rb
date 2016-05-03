Rails.application.routes.draw do
  resources :users
  root 'welcome#home'
  get '/auth/facebook/callback' => 'sessions#create'
end
