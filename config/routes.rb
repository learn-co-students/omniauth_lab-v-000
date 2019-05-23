Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :sessions
resources :welcome#, :as => 'who-we-are'
get '/auth/facebook/callback', to: 'sessions#create'

end
