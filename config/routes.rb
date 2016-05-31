Rails.application.routes.draw do
  root 'welcome#home'
  # our new route for return back from the facebook server
  get '/auth/facebook/callback', to: 'sessions#create'

end
