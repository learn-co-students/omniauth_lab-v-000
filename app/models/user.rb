class User < ActiveRecord::Base
  before_create :set_uuid
  has_secure_password

  def set_uuid
    self.uid = SecureRandom.uuid
  end

end
