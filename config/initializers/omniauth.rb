Rails.application.config.middleware.use OmniAuth::Builder do
      provider :developer unless Rails.env.production?
      provider :facebook, "1728191497450108", "eec056e49f4b0777089110623c19f002"
    end