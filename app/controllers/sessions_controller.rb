class SessionsController < ApplicationController
  def create

    binding.pry

    @user = User.where(name: auth_hash[:info][:name] ).first_or_create do |user|
        user.name = auth_hash[:info][:name]
        user.password = SecureRandom.hex
    end


    session[:user_id] = @user.try(:id)

    redirect_to root_path
   end

   protected

   def auth_hash
     request.env['omniauth.auth']
   end




end
