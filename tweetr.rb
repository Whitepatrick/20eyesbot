require 'twitter'
require_relative 'connectr'

class Updater < Connector

  def initialize(tweet_to_send)
    @tweet_to_send = tweet_to_send
  end

  def send_tweet
    #rest_connector.update(@tweet_to_send)
    p "Just tweeted: #{tweet_to_send}"
  end
end
