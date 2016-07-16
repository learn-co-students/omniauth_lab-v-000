class User < ActiveRecord::Base
  #has_secure_password

  #validates :email, :presence => true
  #validates :email, :uniqueness => true

  def self.find_or_create_by_omniauth(auth_hash)
  	self.where(:email => auth_hash["omniauth.auth"]["info"]["email"]).first_or_create do |user|
  		user.password = SecureRandom.hex
  	end
  end


end
