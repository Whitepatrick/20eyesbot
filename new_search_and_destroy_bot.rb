require 'twitter'
require_relative 'globals'

class SearchAndDestroyBot

  attr_reader :options, :limit

  def initialize

  end


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
       tweet.id
      p "#{tweet.source} just said #{tweet.text}"
      p "*" * 10
    end
  end

end

sadb = SearchAndDestroyBot.new
sadb.twitter_search(10, "metallica", "recent")
