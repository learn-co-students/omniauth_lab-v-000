Rails.application.config.middleware.use OmniAuth::Builder do
	ENV['FACEBOOK_KEY']='121866768396366'
	ENV['FACEBOOK_SECRET']='718e0feef1582b1f47fae33f8ccf6100'
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end