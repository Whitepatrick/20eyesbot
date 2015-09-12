require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class FindAndFollowBot < BotConnector

  def find_and_follow
    HASHTAGS.each do |tag|
      rest_connector.search(tag, result_type: "recent").take(3).each do |tweet|
        rest_connector.follow(tweet.user.id)
        p "Now following: #{tweet.user.id}"
        puts "\n"
        sleep(90)
      end
    end
  end

end

fafb = FindAndFollowBot.new
fafb.find_and_follow
