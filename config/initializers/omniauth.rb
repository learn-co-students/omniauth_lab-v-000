Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['258281964604171'], ENV['b3b29058797b91f081f2f761641db3a4']
end