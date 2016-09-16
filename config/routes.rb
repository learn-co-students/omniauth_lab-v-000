Rails.application.routes.draw do
  get 'sessions/create'

  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'


end
