require 'twitter'
require_relative 'globals'

class SearchAndDestroyBot




  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def twitter_search(limit, search_term, options)
    rest_connector.search(search_term, result_type: options).take(limit).each do |tweet|
      puts "\n"
      p "#{tweet.user.screen_name} user has #{tweet.user.followers_count} followers and has tis to say about SmartBrief: #{tweet.text}"
      puts "\n"
      sleep(1)
    end
  end

end

sadb = SearchAndDestroyBot.new
sadb.twitter_search(10, "smartbrief", "recent")
