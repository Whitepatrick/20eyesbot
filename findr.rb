require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class FindAndFollowBot < BotConnector

  def is_me?(id)
    id == 3305842048
  end

  def find_and_follow
    HASHTAGS.each do |tag|
      puts "following users using the tag: #{tag}"
      rest_connector.search(tag, skip_status: true, result_type: "recent").take(3).each do |tweet|
        tweet_id = tweet.user.id.to_i
        p "Now following: #{tweet.user.screen_name}" unless tweet_id.is_me?
        #rest_connector.follow(tweet.user.id)
        #p "Now following: #{tweet.user.screen_name}"
        sleep(0.25)
      end
    end
    #rest_connector.update("Hey @operations_ivy, I've finished your unholy biding.")
  end

end

fafb = FindAndFollowBot.new
fafb.find_and_follow
