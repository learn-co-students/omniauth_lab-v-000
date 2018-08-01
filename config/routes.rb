Rails.application.routes.draw do
  root "welcome#home"
  resources :users
  get "/auth/facebook/callback" => "sessions#create"

  get "/logout" => "sessions#logout"
end
