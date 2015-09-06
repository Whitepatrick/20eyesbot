require 'twitter'
require_relative 'credentials'
require_relative 'connection'

class BotSearch

  def twitter_search(search_term)
    client_REST = BotConnection.new.connect_REST
    client_REST.search(search_term).take(300).each do |tweet|
      puts tweet.text
    end
  end

end
