class User < ActiveRecord::Base
  def find_or_create_from_omniauth(auth_hash)
    user = User.find_by(email: auth_hash["info"]["email"])
    if user.nil?
      User.create do |u|
        u.name = auth_hash["info"]["name"]
        u.email = auth_hash["info"]["email"]
        u.uid = auth_hash["uid"]
      end
    end
  end
end
