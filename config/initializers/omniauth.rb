# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['296028894078431'], ENV['82b93f5f2218a1c706eadda9299ba839']
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end