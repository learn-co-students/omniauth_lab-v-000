Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '2079071338988580', '2969ed31035652baad46df604c7e74c8'
end
