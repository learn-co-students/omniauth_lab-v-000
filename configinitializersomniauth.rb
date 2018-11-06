Rails.application.config.middleware.use OmniAuthBuilder do
  provider facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
