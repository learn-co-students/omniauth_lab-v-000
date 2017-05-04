class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true

  def self.find_or_create_by_omniauth(auth)
    self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.hex
    end
  end
end
