[x] add omniauth and omniauth-facebook to the Gemfile and then run a bundle install command. 
[x] Create a file named config/initializers/omniauth.rb. It will contain the following lines:
	Rails.application.config.middleware.use OmniAuth::Builder do
	  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
	end

[x] Log in to the Facebook developer site. 
[x] In the My Apps dropdown menu at the top-right of the page, select Add a New App, and a modal should appear. 
[x] Fill out the requested information and click Create App ID.
[x] You should now be on the Product Setup page — if you are not, look in the sidebar for + Add Product under the Products heading. On the Product Setup page, 
[x] click Get Started next to Facebook Login:
 
[x] Choose the Web option, and enter http://localhost:3000/ when it prompts you for your Site URL. Click Save, and then click on Settings under the Facebook Login heading in the sidebar:
 
[x] In the Valid OAuth redirect URIs field, enter https://localhost:3000/auth/facebook/callback, which is the default callback endpoint for the omniauth-facebook strategy:
 
[x] Make sure to prepend your Valid OAuth Redirect URIs with https.
[x] Click Save Changes, and then click on Dashboard in the sidebar. Keep the page handy because we'll need those App ID and App Secret values in a minute, but first...

dotenv-rails
[x]	Add dotenv-rails to your Gemfile and bundle install.
[x]	Create a file named .env at the root of your application (in this case, inside the omniauth_readme/ directory).
[x]	Add your Facebook app credentials to the newly created .env file
	 take the App ID and App Secret values from the Facebook app dashboard...  
	...and paste them into the .env file as follows:
		FACEBOOK_KEY=247632982388118
		FACEBOOK_SECRET=01ab234567890c123d456ef78babc901
[x]	Add .env to your .gitignore file to ensure that you don't accidentally commit your precious credentials.


[x] create a link that will initiate the Facebook OAuth process.  [x] add one to app/views/welcome/home.html.erb:
	[x] <%= link_to('Log in with Facebook!', '/auth/facebook') %>
	[x] we're going to need a User model and a SessionsController to track users who log in via Facebook. The User model should have four attributes, all strings: name, email, image, and uid (the user's ID on Facebook).
	[x] create a single route, sessions#create, which is where Facebook will redirect users in the callback phase of the login process. 
	[x] Add the following to config/routes.rb:
		[x]	get '/auth/facebook/callback' => 'sessions#create'

	Our SessionsController will be pretty simplistic, with a lone action (and a helper method to DRY up our code a bit):
	[x] class SessionsController < ApplicationController
	  [x] def create
	   	 @user = User.find_or_create_by(uid: auth['uid']) do |u|
	      u.name = auth['info']['name']
	      u.email = auth['info']['email']
	      u.image = auth['info']['image']
	    end
	 
	    session[:user_id] = @user.id
	 
	    render 'welcome/home'
  end
	 
	  private
	 
	  def auth
	    request.env['omniauth.auth']
	  end
	end
 [] add a control flow to display user data if the user is logged in and the login link otherwise:
<% if session[:user_id] %>
	  <h1><%= @user.name %></h1>
	  <h2>Email: <%= @user.email %></h2>
	  <h2>Facebook UID: <%= @user.uid %></h2>
	  <img src="<%= @user.image %>">
	<% else %>
	  <%= link_to('Log in with Facebook!', '/auth/facebook') %>
	<% end %>

Now it's time to test it out! It's best to log out of Facebook prior to clicking the login link — that way, you'll see the full login flow.
In order to ensure Rails is using https, do the following to start the server instead of our normal rails s flow:
thin start --ssl

Our app will have one page with a "Login with Facebook" link on it. When the user clicks the link, they'll be asked to authorize our app's access to certain details from their Facebook account. Upon acceptance, our app will use the retrieved data to either locate an existing user account or create a new one, and the user will then be logged in to our app.

There is already a view that outputs all the authentication data and displays the user's photo if one is provided.