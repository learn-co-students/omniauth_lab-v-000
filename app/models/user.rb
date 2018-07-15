class User < ActiveRecord::Base

  def self.find_by_name_fb(auth_hash)
    where(:name => auth_hash[:info][:name]).first
  end

  def self.create_by_name_fb(auth_hash)
    create(name: auth_hash[:info][:name])
  end

end
