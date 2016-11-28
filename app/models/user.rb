class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth)
    self.where(:name => auth["info"]["name"], :uid => auth["uid"]).first_or_create do |user|
      user.email = auth["info"]["email"]
    end
  end
end
