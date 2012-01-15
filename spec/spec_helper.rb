$LOAD_PATH << File.expand_path('../../lib', __FILE__)
ENV["API_KEY"] = 'dev_key'
ENV["API_SECRET"] = 'dev_secret'
require 'weibo'

def create_weibo_client
  Weibo::Config.api_key = ENV["API_KEY"]
  Weibo::Config.api_secret = ENV["API_SECRET"]

  user_key = 'user_key'
  user_secret = 'user_secret'

  weibo_oauth = Weibo::OAuth.new(Weibo::Config.api_key, Weibo::Config.api_secret)
  weibo_oauth_access = weibo_oauth.authorize_from_access(user_key, user_secret)
  Weibo::Base.new(weibo_oauth_access)
end
