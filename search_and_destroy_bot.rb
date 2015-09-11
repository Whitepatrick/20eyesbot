require 'twitter'
require_relative 'globals'

class SearchAndDestroyBot

  attr_accessor :limit. :term, :r_type


  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def twitter_search(limit, search_term, options)
    rest_connector.search(search_term, options).take(limit.to_s).each do |tweet|
      p "#{tweet.name} just said #{tweet.text}"
      p "*" * 10
    end
  end

end

sadb = SearchAndDestroyBot.new
sadb.twitter_search(@limit, @term, result_type: @result_type)
