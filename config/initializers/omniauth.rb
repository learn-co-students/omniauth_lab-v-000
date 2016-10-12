Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1483998928282331", "38374f3f9590cd03e52263327d60c7ef"
end