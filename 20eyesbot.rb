require 'twitter'
require_relative 'src/lib/credentials'
require_relative 'src/lib/connection'
require_relative 'src/lib/search'
require_relative 'src/lib/stream'

=begin

    new_tweet = "test test test"
    client_REST.get_all_tweets("@operations_ivy")
    client_REST.update(new_tweet)

    topics = ["comedy"]
    connect_stream.filter(:track => topics.join(",")) do |object|
      puts object.text if object.is_a?(Twitter::Tweet)
    end
=end
BotStream.new.twitter_stream#("from:operations_ivy")
