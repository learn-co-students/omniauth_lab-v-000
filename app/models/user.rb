class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    self.find_or_create_by(uid: auth_hash[:uid]) do |user|
      user.email = auth_hash[:info][:email]
      user.name = auth_hash[:info][:name]
    end
  end
end
