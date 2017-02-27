Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '1139631299495777', '8da31014b6b2842db902c314f222e5ed'
end