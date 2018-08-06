require 'pry'
class User < ActiveRecord::Base
#  has_secure_password

  def self.find_or_create_by_omniauth (auth)
    # self.where(:email => auth["info"]["email"]).first_or_create do |user|
    #     user.password = SecureRandom.hex
    # end
    binding.pry
    user = User.find_by(:uid => auth["uid"])
    if !user
      user = User.create(auth)
    end
    user
  end
end
