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
    stream_connector.firehose(count: 10).collect do |tweet|
      p tweet.text
    end
  end

  def follow_followers
    rest_connector.follower_ids.each do |follower_id|
      #rest_connector.follow(follower_id)
      p "#{follower_id}"
    end
  end

end

rc = StreamingClient.new
rc.follow_followers
