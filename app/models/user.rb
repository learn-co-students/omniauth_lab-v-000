class User < ActiveRecord::Base
  # has_secure_password
  # devise :omniauthable, omniauth_providers: %i[facebook]
  # before_create :set_uuid
  #
  # validates :email, :presence => true
  # validates :email, :uniqueness => true
  #
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
  #     u.provider = auth.provider
  #     u.uid = auth.uid
  #     u.password = Devise.friendly_token[0,20]
  #   end
  # end
  #
  # def self.find_or_create_by_omniauth(auth_hash) #method signature passing in auth_hash
  #   oauth_email = auth_hash["info"]["email"]
  #   #runs a select, first_or_create will return an instance of a user,
  #   self.where(:email => auth_hash["info"{"email"]).first_or_create do |user|
  #     user.password = SecureRandom.hex
  #   end
  # end
  # #
  # # def set_uuid
  # #   self.uid = SecureRandom.uuid
  # # end

end
