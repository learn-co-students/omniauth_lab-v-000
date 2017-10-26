class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(name: auth_hash[:info][:name]).first_or_create do |user|
      user.email = auth_hash[:info][:email]
      user.provider = auth_hash[:provider]
      user.uid = auth_hash[:uid]
    end
  end
end
