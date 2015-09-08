require 'twitter'
require_relative 'credentials'

# streaming client
class StreamingClient
  def stream_connector
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def twitter_stream
    stream_connector.filter(:track "operations_ivy").collect do |tweet|
      p tweet.text
    end
  end
end

sc = StreamingClient.new
p sc.twitter_stream
