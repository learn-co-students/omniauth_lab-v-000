
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1104623569612268', '5ce21b24d7f90e3fe24b612f62258983'
end
