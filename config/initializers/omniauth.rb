Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['Facebook'], ENV['FACEBOOK_SECRET']
end
