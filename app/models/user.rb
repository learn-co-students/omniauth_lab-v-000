class User < ActiveRecord::Base

    def self.get_by_omniauth(hash)
        User.where(uid: hash[:uid]).first_or_create do |u|
            u.name = hash[:info][:name]
        end
    end

end
