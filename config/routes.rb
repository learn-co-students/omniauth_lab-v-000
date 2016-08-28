Rails.application.routes.draw do
  root 'welcome#home'
  get '/' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
end