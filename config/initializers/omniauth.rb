Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['653357238174168'], ENV['77c61744d5511c8b1e137bc65c7a7f6c']
end
