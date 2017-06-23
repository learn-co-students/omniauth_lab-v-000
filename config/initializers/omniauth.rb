Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 101430110473404, ENV['FACEBOOK_SECRET']
end