Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['614452482266474'], ENV['37bd24d3a4d91967d31d726f6b50e8b6']
end
