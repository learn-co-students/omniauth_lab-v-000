class User < ActiveRecord::Base

  def self.create_or_find_by(uid:)
    found = self.find_by(uid: uid)
    if !found && block_given?
      new_user = self.new
      yield new_user
      new_user.save
    elsif found && !block_given?
      found
    else
      nil
    end
  end

end
