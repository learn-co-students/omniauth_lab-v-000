class WelcomeController < ApplicationController
    def home
        if logged_in?
            render "sessions/create"    
        end
    end
end
