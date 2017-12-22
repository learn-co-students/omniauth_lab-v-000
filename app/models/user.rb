class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_uid = auth_hash['uid']
  
    self.where(:uid => oauth_uid).first_or_create do |user|
      user.name = auth_hash['info']['name']
      user.email = auth_hash['info']['email']
    end
  end
end
