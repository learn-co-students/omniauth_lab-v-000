# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/omniauth-lab
#  create a file called omniauth.rb and put in the following lines:
Rails.application.config.middleware.use OmniAuth::Builder do
  # ...for the moment, our code has the active provider as :developer
  provider :developer unless Rails.env.production?

  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/omniauth-lab
  # Let's update our initializer (config/initializers/omniauth.rb) to look like:
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

  # We commented out the twitter strategy because we won't use it in this lab.
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
