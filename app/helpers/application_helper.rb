module ApplicationHelper
  def current_user
    session[:id]
  end

  def logged_in?
    return false unless session[:id] != "" && session[:id] != nil
  end
end
