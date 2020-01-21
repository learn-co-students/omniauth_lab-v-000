Rails.application.routes.draw do
  root 'welcome#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/github/callback', to: 'sessions#create'
  
end
