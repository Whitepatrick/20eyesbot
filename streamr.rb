require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class StreamBot < BotConnector

  def stream_timeline
    stream_connector.filter("https://twitter.com/20eyesbot").each do |tweet|
      p tweet.text
    end
  end
end

sb = StreamBot.new
sb.stream_timeline
