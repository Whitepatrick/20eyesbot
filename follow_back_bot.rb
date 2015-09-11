require 'twitter'
require_relative 'credentials'

class FollowBackBot
  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def get_follower_ids
    follower_list = rest_connector.followers
    follower_list.each do |follower|
      #rest_connector.follow(follower_id)
      p "#{follower.screen_name}"
    end
  end
end

fbb = FollowBackBot.new
fbb.get_follower_ids
