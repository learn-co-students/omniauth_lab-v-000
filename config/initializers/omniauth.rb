Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '548682191988414', '9b05b67e52eefd404d6b7f8ae19b88a4'
    end
