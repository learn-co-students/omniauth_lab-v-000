Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '441869945938377', '7b0dae8a23bdfc8b2991410a36571177'
    end
