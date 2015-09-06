require 'twitter'
require_relative 'credentials'
require_relative 'connection'
require_relative 'search'

class BotStream
  attr_accessor :home_timeline

  def initialize
    @home_timeline = :home_timeline
  end

  def twitter_stream
    client_stream = BotConnection.new.connect_stream
    home_timeline => client_stream.home_timeline
  end

end
