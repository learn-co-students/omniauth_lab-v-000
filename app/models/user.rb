class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth)
   user = self.find_or_create_by(name: auth[:info][:name], uid: auth[:uid])
 end
end
