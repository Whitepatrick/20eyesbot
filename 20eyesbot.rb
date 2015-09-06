require_relative 'src/lib/credentials'
require_relative 'src/lib/connection'
require 'twitter'

=begin
what bot does:

  - mentions/dm's
    - store anything mentioning or a DM into a postgres db
      - display stored tweet data on 20eyes.org
    - reply to any mention with
      - "i serve the kwisatz haderach, @operations_ivy."

  - announces jenkins info

  - retweet anything that says:
    - 20 eyes
    - twenty eyes
    - 20eyes
    - twentyeyes
    new_tweet = "test test test"
    client_REST.get_all_tweets("@operations_ivy")
    client_REST.update(new_tweet)

    topics = ["comedy"]
    connect_stream.filter(:track => topics.join(",")) do |object|
      puts object.text if object.is_a?(Twitter::Tweet)
    end
=end
client_REST = Connection.new.connect_REST
connect_stream = Connection.new.connect_stream

def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def client_REST.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end

client_REST.get_all_tweets("kimkardashian")
