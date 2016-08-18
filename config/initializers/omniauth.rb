Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
#ENV constant refers to a global hash for your entire computer environment. You can store any key value pairs in this environment and so it's a very useful place to store credentials that we don't want to be managed by git and later stored on github (if your repo is public). The most common error we see from students here is that when ENV["PROVIDER_KEY"] is evaluated in the initializer it returns nil! Then later when you try and authenticate with the provider you'll get some kind of 4xx error because the provider doesn't recognize your app.
#To recieve these credentials, each provider's process is different, but you'll essentially need to register your app with the provider and they'll give you a set of keys specific to your app.
