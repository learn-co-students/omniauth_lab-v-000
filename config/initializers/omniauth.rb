Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '174114333022758', '84e083474eff08ee027558e0fb57041b'
end