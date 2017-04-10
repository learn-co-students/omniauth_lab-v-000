class User < ActiveRecord::Base
    
    def self.find_or_create_from_auth_hash(auth_hash)
        info = auth_hash[:info]
        where(:uid => auth_hash[:uid]).first_or_create do |u|
            u.name = info['name']
            u.email = info['email']
        end
    end
end
