class User < ActiveRecord::Base

  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:name => auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.uid = auth_hash['uid']
    end
  end
end
