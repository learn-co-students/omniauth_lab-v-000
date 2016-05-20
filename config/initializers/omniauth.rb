Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '230594277314434', 'b98e76603242b58f856242dbc6aadc08'
  end
