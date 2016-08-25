Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']
end
