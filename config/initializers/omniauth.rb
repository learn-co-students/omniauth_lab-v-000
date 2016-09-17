Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '453068414817590', '43745a010e6bfe483582f2e298ce344b'
end
