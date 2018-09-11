class WelcomeController < ApplicationController
  helper :application

  def index
    @user = auth[:info] if auth
  end

end
