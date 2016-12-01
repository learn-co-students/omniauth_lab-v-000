Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end


# FACEBOOK_APP_ID=1805708009699992 FACEBOOK_SECRET=9c9fafbc0f5b5c629e055b28929705d1 rails s
