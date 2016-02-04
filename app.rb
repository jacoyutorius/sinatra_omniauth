require "sinatra"
require "sinatra/reloader"
require "omniauth"
require "omniauth-facebook"
require "omniauth-google-oauth2"
require "omniauth-github"
require "json"

class SinatraOmniAuth < Sinatra::Base
  configure do
    set :sessions, true
    set :inline_templates, true
  end

  use OmniAuth::Builder do
    provider :facebook,       ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"]
    provider :google_oauth2,  ENV["GOOGLE_APP_ID"],   ENV["GOOGLE_APP_SECRET"]
    provider :github,         ENV["GITHUB_APP_ID"],   ENV["GITHUB_APP_SECRET"]
  end

  get "/" do
    erb <<-"EOS"
      <a href='/auth/facebook'>Login with Facebook</a><br>
      <a href='/auth/google'>Login with Google</a><br>
      <a href='/auth/github'>Login with Github</a>
    EOS
  end

  get "/auth/:provider/callback" do
    @provider = params[:provider]
    @result = request.env["omniauth.auth"]
    erb <<-"EOS"
      <a href='/'>Top</a><br/>
      <h1><%= @provider %></h1>
      <pre><%= JSON.pretty_generate(@result) %></pre>
    EOS
  end
end

SinatraOmniAuth.run! if __FILE__ == $0
