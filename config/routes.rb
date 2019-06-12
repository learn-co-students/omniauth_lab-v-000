Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get '/create' => 'sessions#create'
  get 'auth/:provider/callback' => 'sessions#create'

end
