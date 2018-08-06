class User < ActiveRecord::Base
  devise :omniauthable, omniauth_providers: %i[facebook]
  before_create :set_uuid
  has_secure_password



  def set_uuid
    self.uid = SecureRandom.uuid
  end

end
