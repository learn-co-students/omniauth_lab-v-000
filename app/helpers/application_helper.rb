module ApplicationHelper
  
  def check_sign_in(user)
    if !user.nil?
      yield
    end
  end
  
end