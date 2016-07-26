  Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['857056331104690
'], ENV['e27fc5727e87bc9fd82c69df3fbbe681']
    end