class WelcomeController < ApplicationController
  def home
    @auth = auth if auth
  end
end
