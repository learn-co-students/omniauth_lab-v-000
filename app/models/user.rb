class User < ActiveRecord::Base
  #has_secure_password

  def self.find_or_create_by_fb_email(fb_name, fb_email, fb_uid)
    user = self.find_by(uid: fb_uid)
    if user
      return user
    else
      user = self.create(name: fb_name, email: fb_email, uid: fb_uid)
    end
  end

end
