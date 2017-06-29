class User < ActiveRecord::Base

	def self.find_or_create_by_omniauth(auth_hash)
     #    if user = User.find_by(:uid => auth_hash[:uid])
     #        return user
     #    else
     #       user = User.new(:uid => auth_hash[:uid])
     #       user.uid = auth_hash[:info][:email]
		   # user.name = auth_hash[:info][:name]   
		   # user.image = auth_hash[:info][:image]
     #       if user.save
     #         return user
     #       else
     #         raise user.errors.full_messages.inspect
     #       end
     #    end  



		self.where(:uid => auth_hash[:uid]).first_or_create do |user|
			user.uid = auth_hash[:info][:email]
		  user.name = auth_hash[:info][:name]   
			user.image = auth_hash[:info][:image]
		end
	end
end