module ApplicationHelper



    def logged_in?
        !session[:user_id].nil? && !session[:user_id].empty?
    end
end
