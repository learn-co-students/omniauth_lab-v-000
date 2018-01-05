class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.uid = auth_hash["info"]["uid"]
    end  
  end


end
