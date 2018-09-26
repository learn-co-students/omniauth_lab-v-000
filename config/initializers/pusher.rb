require 'pusher'

Pusher.app_id = '573637'
Pusher.key = 'e8b20b59c221de607bd4'
Pusher.secret = '55ce167649293cde04b5'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

# Pusher.app_id = ENV["pusher_app_id"]
# Pusher.key    = ENV["pusher_key"]
# Pusher.secret = ENV["pusher_secret"]

# Pusher.app_id = Figaro.env.pusher_app_id!
# Pusher.key    = Figaro.env.pusher_key!
# Pusher.secret = Figaro.env.pusher_secret!
