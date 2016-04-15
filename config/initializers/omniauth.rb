Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '860781947382363', '09c76dc0adb1488ba19f75179a8b93f3'
  puts "OmniAuth Loaded!!!!"
end