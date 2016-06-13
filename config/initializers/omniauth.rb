Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '1147144375356905', 'e26ea76df85e7e022df01e41f58b5500'
end
