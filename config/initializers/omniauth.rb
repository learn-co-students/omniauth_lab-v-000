Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1815720018742674", "254a993d16b1e00774273200c969f84e"
end
