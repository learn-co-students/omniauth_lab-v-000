Rails.application.routes.draw do
  resources :users
  get 'sessions/create'
  get '/', to: 'welcome#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
