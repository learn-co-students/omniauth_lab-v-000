Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID']='1026746250778899', ENV['FACEBOOK_SECRET']='f4e12c883334b12cb189cc3bf8520319'
end
