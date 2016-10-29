Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "875860182514901", "38ef3b12c9b575b167d40d732a8746c2"
end