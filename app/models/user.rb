class User < ActiveRecord::Base

    def self.find_or_create_by_omniauth(auth_hash)
        oauth_uid = auth_hash["uid"]
        if user = User.find_by(:uid => oauth_uid)
            return user
        else
            user=User.create(:uid => oauth_uid, 
                             :email => auth_hash["info"]["email"],
                             :name => auth_hash["info"]["name"]
            )
        end
    end
end