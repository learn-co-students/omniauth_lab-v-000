class User < ActiveRecord::Base

  def self.find_or_create_by_omni_auth(auth_hash)
    User.find_or_create_by(uid: auth_hash[:uid]) do |u|
      u.name = auth_hash[:info][:name]
      u.image = auth_hash[:info][:image]
    end
  end

end
