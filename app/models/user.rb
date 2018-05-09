class User < ActiveRecord::Base

	def self.find_or_create_by_omniauth(auth)
		where(name: auth[:info][:name]).first_or_create do |user|
			user.email = auth[:info][:email]
			user.name = auth[:info][:name]
			user.image = auth[:info][:image]
			user.uid = auth[:info][:uid]
		end 
	end 

end
