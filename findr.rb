require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class FindAndFollowBot < BotConnector

  def find_and_follow
    HASHTAGS.reverse.each do |tag|
      puts "following users using the tag: #{tag}"
      rest_connector.search(tag, result_type: "recent").take(5).each do |tweet|
        rest_connector.follow(tweet.user.id)
        p "Now following: #{tweet.user.screen_name}"
      end
      sleep(301)
    end
    rest_connector.update("Hey @operations_ivy, I've finished your unholy biding.")
  end

end

fafb = FindAndFollowBot.new
fafb.find_and_follow
