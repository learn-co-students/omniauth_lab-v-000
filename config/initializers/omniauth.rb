Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "187769231715569", "3c8781ae98e5f994411015f7fb053e65"
end