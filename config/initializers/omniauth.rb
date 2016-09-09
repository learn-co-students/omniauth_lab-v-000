Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['324698337883741'], ENV['1534e4c93d81e01dcb9d6167cc2a262c']
end
