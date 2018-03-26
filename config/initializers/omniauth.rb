Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '2039406986315678', '797f992343d586343365b9272136c61f'
 #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
   #Client key - identifies the Facebook app id
   #provider :facebook, ‘2039406986315678’,
   #Client secret - the password for my Facebook app secret
   #‘797f992343d586343365b9272136c61f’
   #provider :facebook, 'APP_KEY', 'APP_SEC_KEY'
