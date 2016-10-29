Rails.application.routes.draw do
  get 'sessions/create'

  root 'welcome#home'
end
