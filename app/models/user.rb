class User < ActiveRecord::Base

	def self.find_or_create_from_auth_hash(auth_hash)
		# byebug
		where(uid: auth_hash['uid']).first_or_create do |user|
			user.name = auth_hash['info']['name']
		end
	end

end
