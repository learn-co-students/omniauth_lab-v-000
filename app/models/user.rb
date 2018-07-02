class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(uid: auth['uid']).first_or_create do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.provider = auth['provider']
    end
  end
end
