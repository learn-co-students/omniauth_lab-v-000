Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['480629982458973'], ENV['298012be39009dd780d3f7047c7ccba4']
end
