Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '189887005102251', '322b0d7c6bcd61a0242d5bb102dcfb36'
end
