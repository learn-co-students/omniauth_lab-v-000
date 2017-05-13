Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1889368057990508', '96b707558c753d40c19079fbd11bb5f6'
end
