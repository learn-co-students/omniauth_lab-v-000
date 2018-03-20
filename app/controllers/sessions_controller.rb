class SessionsController < ApplicationController
      def create
#binding.pry
        #raise params.inspect
          #facebook will send back information that will be forwarded from the config/routes file into the create action
          @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name  = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
          end
          session[:user_id] = @user.id
          render 'welcome/home'
      end

      private

      def auth
          request.env['omniauth.auth']
      end
end
