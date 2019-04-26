Rails.application.routes.draw do
  resources :users
  root 'welcome#home'

  get '/auth/github/callback' => 'sessions#create'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
