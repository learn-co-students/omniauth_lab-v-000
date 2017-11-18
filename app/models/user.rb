class User < ActiveRecord::Base
  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash[:info][:uid]).first_or_create do |user|
      user.name = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
    end
  end
end
