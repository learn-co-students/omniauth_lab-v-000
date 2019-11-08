# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/omniauth-lab
# ...let's add the following line to config/routes.rb
Rails.application.routes.draw do
  get 'welcome/home'
  # Add your routes here
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # ...make welcome#home be the root route for this Rails application.
  root 'welcome#home'
end
