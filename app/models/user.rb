class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth (auth)
    user = User.find_by(:uid => auth["uid"])
    if !user
      user = User.create(:uid => auth["uid"], :name => auth["info"]["name"], :email => auth["info"]["email"])
    end
    user
  end
end
