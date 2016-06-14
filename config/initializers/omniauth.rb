  Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'] # faking it, no facebook
    end

