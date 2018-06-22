Rails.application.routes.draw do
  root 'welcome#home'

  get '/sessions', to: 'sessions#create'
  post '/sessions', to: 'sessions#create'
  get '/welcome', to: 'welcome#home'
 
end
