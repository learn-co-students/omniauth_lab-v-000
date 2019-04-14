Rails.application.routes.draw do
  get '/create' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
