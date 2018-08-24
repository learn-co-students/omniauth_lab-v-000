Figuring out omniauth
Oauth 2 is the protocol of the "double handshake" between your application and a provider/strategy, such as fb, twitter, github, etc.  It authenticates that a user is who they say they are.

omniauth is a collection of gems that support each individual strategy.  omniauth and omniauth-provider will need to be required in the gem files.

The convention is to initialize your application with a file called `omniauth.rb` that starts every time your application starts in a server.

QUESTION:  What does that initialize?  Is this considered "middleware" ?  
I think that it initializes some information in the ENV hash. Two pieces of information:  FACEBOOK_KEY and FACEBOOK_SECRET for example ???  Not 100% sure.

Configuring the omniauth strategy for your app is fuzzy!!  For facebook, you must create an omniauth app on the facebook developers website.  For github, you must go into settings and create an oauth app as well. This will ask you to configure the app with a description, and a URL (http://localhost:3000 in our case).  once this is configured, it will also give you the key and secret from above.  

QUESTION: What do these tokens do exactly?

In your routes.rb file, after te app is configured, you must create a GET route called '/auth/:provider/callback'  

QUESTION: How does the app know to visit the provider website? Is it because you told the straetgy website that the URL is localhost:3000?  Therefore, if you click "localhost:3000/auth/github/callback" then github already knows what app it is providing authorization for? Maybe?  

ONCE AUTHORIZED...

You have access to the tokens in your environment hash.  Access this information -- it's a lot of info -- in your sessions controller!  sessions#create specifically.  When you hit that action, you include the logic for a traditional login OR the omniauth login.  For omniauth, you can user `request.env["omniauth.auth"]` to get to the hash of info provided by the strategy you used.  This is where you can find your user's email.


`request` only exists in controllers.
So, if you abstract out that variable... Youd have to change the reference.   `auth_hash` is passed in to the info (from the controller) then you'll have the info in that variable instead.
From 42:00 in the oauth video lecture


So, when you set up the Omniauth middleware in your initializer, you want to set up the ENV keys `ENV[CLIENT_KEY]` and `ENV[CLIENT_SECRET]` but won't want to have the actual tokens in there. QUESTION: Is that for security reasons?  In case someone snags your source code?

So, instead, you can use the gems Figaro or Dotenv to put the actual tokens in there as ... Config files?  ... TODO:  More research. But, i remember dotenv from the walkthrough so maybe I will remember how to use that one.
