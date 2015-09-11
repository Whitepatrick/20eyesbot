require 'twitter'
require_relative 'globals'

class FollowBackBot
  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def follow_back
    p "Following: "
    rest_connector.followers.each do |follower|
      rest_connector.follow(follower)
      p "#{follower.screen_name}:#{follower.id}"
    end
  rescue Exception => e
    rest_connector.update("@operations_ivy :FBB something went wrong - #{e}")
  end

  def get_friends
    p "Friend with: "
    rest_connector.friends.each do |friend|
      p "#{friend.screen_name}:#{friend.id}"
    end
  rescue Exception => e
    rest_connector.update("@operations_ivy :FBB something went wrong - #{e}")
  end

end

fbb = FollowBackBot.new
fbb.follow_back
#fbb.get_friend_ids
