require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class FollowBackBot < BotConnector

  def get_follower_ids
    follower_list = rest_connector.followers
    follower_list.each do |follower|
      rest_connector.follow(follower.id)
      puts "now following: #{follower.id}"
    end
  end
end

fbb = FollowBackBot.new
fbb.get_follower_ids
