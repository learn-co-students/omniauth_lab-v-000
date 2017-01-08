require 'pry'

class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(omni_hash)
    user = User.find_or_create_by(uid: omni_hash[:uid])
    user.update(omni_hash[:info])
    user
  end

end
