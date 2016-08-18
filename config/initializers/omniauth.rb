    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, '930361850426163', '9f88a822f99923b1576b1751af441b8c'
    end