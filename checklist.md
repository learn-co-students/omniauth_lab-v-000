# OmniAuth Checklist

## Prerequisites - Storing keys reliably and securely

1. `ENV`

    The `ENV` constant refers to a global hash for your entire computer environment. You can store any key-value pairs in this hash, so it's a very useful place to keep credentials that we don't want to be managed by Git or displayed on GitHub (especially if your GitHub repo is public). The most common error students run into is that when `ENV[PROVIDER_KEY]` is evaluated in the OmniAuth initializer it returns `nil`. Later attempts to authenticate with the provider will cause some kind of `4xx` error because the provider doesn't recognize the app's credentials (because they're evaluating to `nil`).

2. `dotenv-rails`

    Instead of setting environment variables directly in our local `ENV` hash, we're going to let an awesome gem handle the hard work for us. `dotenv-rails` is one of the best ways to ensure that environment variables are correctly loaded into the `ENV` hash in a secure manner.

## OmniAuth with Facebook

1. Add the gems

    Add the OmniAuth gem and the provider-specific OmniAuth gem (e.g., `omniauth-facebook`). In some cases, adding only the provider-specific gem will suffice because it will install the OmniAuth gem as a dependency, but it's safer to add both — the shortcut is far from universal. Also add the `dotenv-rails` gem.

    ```ruby
    gem 'omniauth'
    gem 'omniauth-facebook'
    gem 'dotenv-rails'
    ```

    Run `bundle install`. If we were so inclined, we could add additional OmniAuth gems to our heart's content, offering login via multiple providers in our app.

2. Tell OmniAuth where to find our credentials

    Next, we'll need to tell OmniAuth about our app's OAuth credentials. Create a file named `config/initializers/omniauth.rb`. It will contain the following lines

    ```ruby
    Rails.application.config.middleware.use OmniAuthBuilder do
      provider facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    end
    ```

    The code is unfamiliar, but we can guess what's going on from the characteristically clear Rails syntax. We're telling our Rails app to use a piece of middleware created by OmniAuth for the Facebook authentication strategy.

    The `ENV` is a very useful place to keep credentials that we don't want to be managed by Git or displayed on GitHub (especially if your GitHub repo is public). The most common error students run into is that when `ENV[PROVIDER_KEY]` is evaluated in the OmniAuth initializer it returns `nil`. Later attempts to authenticate with the provider will cause some kind of `4xx` error because the provider doesn't recognize the app's credentials (because they're evaluating to `nil`).

    As you can gather from the initializer code, we're going to need two pieces of information from Facebook in order to get authentication working the application key and secret that will identify our app to Facebook.

3. setup .env file to hold our credentials

    Instead of setting environment variables directly in our local `ENV` hash, we're going to let an awesome gem handle the hard work for us. `dotenv-rails` is one of the best ways to ensure that environment variables are correctly loaded into the `ENV` hash in a secure manner. Using it requires four steps

    - Create a file named `.env` at the root of your application (in this case, inside the `omniauth_readme` directory).

    - Add `.env` to your `.gitignore` file to ensure that you don't accidentally commit your precious credentials.

4. Get App ID and Secret from the provider

    Log in to  [the Facebook developer site](https://developers.facebook.com/). In the `My Apps` dropdown menu at the top-right of the page, select `Add a New App`, and a modal should appear. Fill out the requested information and click `Create App ID`. You should now be on the `Product Setup` page — if you are not, look in the sidebar for `+ Add Product` under the `Products` heading. On the `Product Setup` page, click `Get Started` next to `Facebook Login`

    ![Facebook Login](https://user-images.githubusercontent.com/17556281/27402847-25d8c782-5696-11e7-8fa0-2aaa6602de06.png)

    Choose the `Web` option, and enter `https://localhost:3000/` when it prompts you for your `Site URL`. Click `Save`, and then click on `Settings` under the `Facebook Login` heading in the sidebar

    (NOTE The urls in the two images below should be prefixed with `https://`)

    ![Facebook Login Settings](https://user-images.githubusercontent.com/17556281/27403332-0cf83f84-5698-11e7-9e59-acb8ec82a5d2.png)

    In the `Valid OAuth redirect URIs` field, enter `https://localhost:3000/auth/facebook/callback`, which is the default callback endpoint for the `omniauth-facebook` strategy

    ![Valid OAuth redirect URIs](https://user-images.githubusercontent.com/17556281/27404131-f5aea626-569a-11e7-9f76-df563870d81a.png)

    (Note as of March 2018, Facebook requires `https` uris for redirects. Make sure to prepend your `Valid OAuth Redirect URIs` with `https`.)

    Click `Save Changes`, and then click on `Dashboard` in the sidebar.

5. Add your Facebook app credentials to the `.env` file

    Take the `App ID` and `App Secret` values from the Facebook app dashboard and paste them into the `.env` file as follows

    ![Facebook App Dashboard](https://user-images.githubusercontent.com/17556281/27404133-f7220c00-569a-11e7-9494-bc3c805b31d0.png)

    ```ruby
    FACEBOOK_KEY=247632982388118
    FACEBOOK_SECRET=01ab234567890c123d456ef78babc901
    ```

6. Routing OAuth flow in your application

    We now need to create a link that will initiate the Facebook OAuth process. The standard OmniAuth path is `/auth/:provider`, so, in this case, we'll need a link to `/auth/facebook`. Let's add one to `app/views/welcome/home.html.erb`:

    ```erb
    <%= link_to('Log in with Facebook!', '/auth/facebook') %>
    ```

7. User Model

    Next, we're going to need a `User` model and a `SessionsController` to track users who log in via Facebook. The `User` model should have four attributes, all strings `name`, `email`, `image`, and `uid` (the user's ID on Facebook).

8. Routes

    To handle user sessions, we need to create a single route, `sessions#create`, which is where Facebook will redirect users in the callback phase of the login process. Add the following to `config/routes.rb`

    ```ruby
    get '/auth/facebook/callback' => 'sessions#create'
    ```

9. SessionsController

    Our `SessionsController` will be pretty simplistic, with a lone action (and a helper method to DRY up our code a bit)
    ```ruby
    class SessionsController  ApplicationController
      def create
        @user = User.find_or_create_by(uid auth['uid']) do u
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end

        session[user_id] = @user.id

        render 'welcome/home'
      end

      private

      def auth
        request.env['omniauth.auth']
      end
    end
    ```

10. Add control flow to the home page for logged in and logged out users

    And, finally, since we're re-rendering the `welcome#home` view upon logging in via Facebook, let's add a control flow to display user data if the user is logged in and the login link otherwise

    ```erb
    <% if session[:user_id] %>
    <h1><%= @user.name %></h1>
    <h2>Email: <%= @user.email %></h2>
    <h2>Facebook UID: <%= @user.uid %></h2>
    <img src="<%= @user.image %>">
    <% else %>
    <%= link_to('Log in with Facebook!', '/auth/facebook') %>
    <% end %>
    ```

11. Fake https in development

    In order to ensure Rails is using https, do the following to start the server instead of our normal `rails s` flow

    `thin start --ssl`

Now it's time to test it out! It's best to log out of Facebook prior to clicking the login link — that way, you'll see the full login flow.
