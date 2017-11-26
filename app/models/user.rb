class User < ActiveRecord::Base

	def self.find_or_create_from_auth_hash(auth_hash)
		# byebug
		where(email: auth_hash['info']['email']).first_or_create do |user|
			password = SecureRandom.hex
		end
	end

end
