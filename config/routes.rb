Rails.application.routes.draw do
  # Add your routes here
  match '/auth/:provider/callback', to: 'sessions#cretae', via: [:get, :post]
  root 'welcome#home'
end
