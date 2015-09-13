require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class ReplyToTweetBot < BotConnector

  def reply_when_tweeted
    stream_connector.user { |tweet| p tweet.text }
  end

end

rttb = ReplyToTweetBot.new
rttb.reply_when_tweeted
