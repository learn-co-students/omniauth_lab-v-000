class User < ApplicationRecord
  # has_secure_password

  def self.create_with_omniauth(auth)

    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.email = "#{auth['uid']}@#{auth['provider']}.com"
    user.password = auth['uid']
    user.name = auth['info']['name']
    if User.exists?(user.uid)
      user
    else
      user.save!
      user
    end
  end
end
