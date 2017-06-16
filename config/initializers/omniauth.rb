Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['144960532732563'], ENV['6d9a6e923300128305dc2f0b73bd2bc1']
end
