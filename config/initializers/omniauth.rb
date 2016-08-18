Rails.application.config.middleware.use OmniAuth::Builder do
   provider :developer unless Rails.env.production?
   provider :facebook, '113998869050098', 'dc3634c9e5222d7e1c640a32f6e7b8ed'
 end
