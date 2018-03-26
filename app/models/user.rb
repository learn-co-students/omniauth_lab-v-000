class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true
  #validates :email, presence: true
  #validates :email, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
  #User is login via OAuth
  #User is 100% trusted coming from Facebook
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      #Seen this User before, log User in
    end
  end
end
