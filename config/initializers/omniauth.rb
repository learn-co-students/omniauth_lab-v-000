Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end

#FACEBOOK_APP_ID=282498218749020 FACEBOOK_SECRET=5007f6e67d8dffa76bca9d2baf039020 rails s