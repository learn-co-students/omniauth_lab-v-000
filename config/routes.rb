Rails.application.routes.draw do
  root 'welcome#home'
  resources :users, :sessions
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/privacy', to: 'sessions#privacy'
end
