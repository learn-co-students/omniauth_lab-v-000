class User < ActiveRecord::Base
  has_secure_password

  def self.find_or_create_by_omnihash(omnihash)
    uid = omnihash["uid"]
    if user = User.find_by(uid: uid)
      user
    else
      oauth_email = omnihash["info"]["email"]
      name = omnihash["info"]["name"]
      User.create(name: name, uid: uid, email: oauth_email, password: SecureRandom.hex)
    end
  end

end
