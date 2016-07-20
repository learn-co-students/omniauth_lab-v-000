Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

# 1106919392712606
# 4b5bb636d42fbd6fa7cfa41f74f95d92
