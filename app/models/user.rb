class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth)
    self.where(name: auth[:info][:name]).first_or_create do |u|
      u.email = auth[:info][:email]
      u.name = auth[:info][:name]
      u.image = auth[:info][:image]
      u.uid = auth[:uid]
    end
  end

end
