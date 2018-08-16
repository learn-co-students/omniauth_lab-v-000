class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def auth
    @auth = request.env['omniauth.auth']
    #<OmniAuth::AuthHash
      # credentials=
        # <OmniAuth::AuthHash
          # expires=true expires_at=1539557207
          # token="EAAgJZCiFp7AMBAKiQCqllBkkkKK0msXBHq5ICtqujMZBT0Gv86Ek6FrZC7iqPP36EQowpmPKhn3SkdZA3HZBvQkBZAQ9ZC1bjmRB5hZC0r0B5SHJbBUG7S9ZBRO2ckbAUjmHYRP74n71SQoFpEOYAq9OqZBkQXSCSsyHrgqBAI74Jzt8LkEN60Fpvk">

      # extra=
        # <OmniAuth::AuthHash
          # raw_info=
            # <OmniAuth::AuthHash
              # email="laura.trager@gmail.com"
              # id="10155894914613391"
              # name="Laura Trager">>

      # info=
        # <OmniAuth::AuthHash::InfoHash
          # email="laura.trager@gmail.com"
          # image="http://graph.facebook.com/v2.10/10155894914613391/picture"
          # name="Laura Trager">

      # provider="facebook"

      # uid="10155894914613391">
  end


end
