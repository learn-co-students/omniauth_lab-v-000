Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '436194180229825', '61686b6e892c068fbd04a730ef32051'
end