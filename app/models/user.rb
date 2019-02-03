class User < ActiveRecord::Base

def self.find_or_create_by_omniauth(auth_hash)
  self.where(:email => auth_hash["info"]["email"]).first_or_create
end 
end
