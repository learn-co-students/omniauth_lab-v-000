Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '2079050572353452', '6cf20ac472db0c17e7df219f725b3c67'
end
