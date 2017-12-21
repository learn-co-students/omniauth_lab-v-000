class WelcomeController < ApplicationController
  def home
    <%= link_to('Log in with Facebook!', '/auth/facebook') %>
  end
end
