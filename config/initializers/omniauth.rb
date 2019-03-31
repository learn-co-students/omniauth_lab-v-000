Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '673746319705214', 'ede8a5b06bc4875e268259262d9050e1'

  #ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  
end
