# go to twitterdev/bookmarks-search on github.

rails new bookmark-search -j esbuild -c tailwind -d postgresql -T --main
# we're gonna use esbuild for javascript, tailwind for css, postgresql for db, -T to skip tests, --main for github main branch.
# check the open source on : cjav.dev/posts/starting-new-rails-app-2022

# open up package.json and drop scripts from the open-source of twitterdev page.

"scripts": {
  "build": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds",
  "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"
}

bundle add omniauth
bundle add omniauth-rails_csrf_protection
bundle add omniauth-twitter2

#open config/initializers/omniauth.rb and add :

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
end

rails g controller StaticPages root

# go to routes.rb :

root "static_pages#root"

# go to root.html.erb

<%= form_tag('/auth/developer', method: 'post', data: {turbo: false}) do %>
  <button type='submit'>Login with Developer</button>
<% end %>

## go to routes.rb :

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'

rails g controller Sessions

# go to app/controller/sessions_controller.rb:

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def new
    render :new
  end

  def create
    user_info = request.env['omniauth.auth']
    binding.pry
    render json: user_info
  end
end

##### note, you have to install pry by ( gem install pry)
## also, try to make the app without it at first, as it may complicate the server.

#open config/initializers/omniauth.rb and add :

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider(
    :twitter2,
    client id,
    client secret,
    callback_path: "/auth/twitter2/callback",
    scope: "tweet.read users.read bookmark.read offline.access"
    )
end

# you can store client_id and client_secret inside credentials.rb and edit it like this:

rails credentials:edit

twitter:
  client_id:
  client_secret:

# go to root.html.erb

<%= form_tag('/auth/developer', method: 'post', data: {turbo: false}) do %>
  <button type='submit'>Login with Developer</button>
<% end %>

<%= form_tag('/auth/twitter2', method: 'post', data: {turbo: false}) do %>
  <button type='submit'>Login with Twitter</button>
<% end %>

### now, we need to setup a user model to store all the info that comes up from twitter into DB:

rails g model User twitter_id nickname name token refresh_token expires_at:date_time

rails db:migrate

### go to SessionsController, into create method:


  @user = User.find_by(twitter_id: user_info.uid)
  if @user.nil?
    # create new user :
    @user = User.create!(
      twitter_id: user_info.uid,
      nickname: user_info.info.nickname,
      name: user_info.info.name,
      token: user_info.credentials.token,
      refresh_token: user_info.credentials.refresh_token,
      expires_at: Time.at(user_info.credentials.expires_at).to_datetime
    )

    #if we've already seen this user, update their tokens like this :
  else
    @user.update(
      token: user_info.credentials.token,
      refresh_token: user_info.credentials.refresh_token,
      expires_at: Time.at(user_info.credentials.expires_at).to_datetime
    )

    # cookie the user and store their sessin :
    session[:user_id] = @user.id
