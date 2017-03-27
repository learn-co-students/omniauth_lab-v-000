class User < ActiveRecord::Base

  def self.find_or_create_from_omniauth(auth)
    self.where(:uid => auth["uid"]).first_or_create do |user|
      user.email = auth["info"]["email"]
      user.name = auth["info"]["name"]
    end


  end
end
