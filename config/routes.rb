Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/facebook/callback', to: 'sessions#create'
end
