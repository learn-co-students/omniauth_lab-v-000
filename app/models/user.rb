class User < ActiveRecord::Base

  def self.from_omni(auth)
    find_or_create_by(uid: auth[:uid]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
    end
  end

end
