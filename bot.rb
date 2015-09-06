require 'twitter'
require_relative 'credentials'

class RESTClient
  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  # returns 3 recent tweets of term provided
  def twitter_search(search_term, options)
    rest_connector.search(search_term, options).take(3).each do |tweet|
      p tweet.text
      p "*" * 10
    end
  end

  def get_follower_ids
    rest_connector.follower_ids.each do |follower_id|
      rest_connector.follow(follower_id)
      p "Now following #{follower_id}"
    end
  end
end

rc = RESTClient.new
rc.get_follower_ids

# streaming client
class StreamingClient
  def stream_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def twitter_stream
    stream_connector.firehose("operations_ivy").collect do |tweet|
      p tweet.text
    end
  end
end
