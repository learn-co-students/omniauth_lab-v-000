Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production? -not sure what this line means
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end