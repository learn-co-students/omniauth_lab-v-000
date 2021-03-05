Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get "/", to: 'welcome#home', as: 'root'
end
