class User < ActiveRecord::Base

  def self.from_oath(auth_hash)
    self.where(name: auth_hash['info']['name']).first_or_create do |u|
      u.name = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.image = auth_hash['info']['image']
      u.uid = auth_hash['uid']
    end
  end
end
