class User < ActiveRecord::Base
  def self.find_or_create_by_omniauth(auth_hash)
    self.where(name: auth_hash["name"]).first_or_create do |user|
      user.email = auth_hash["email"]
      user.name = auth_hash["name"]
    end
  end
end
