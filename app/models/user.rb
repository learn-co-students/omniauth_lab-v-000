class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(uid: auth_hash[:uid]).first_or_create do |u|
      u.email = auth_hash[:info][:email]
      u.name = auth_hash[:info][:name]
      u.image = auth_hash[:info][:image]
    end
  end
end
