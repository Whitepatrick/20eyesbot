require 'twitter'
require_relative 'globals'
require_relative 'bot_connector'

class SearchAndDestroyBot < BotConnector

  def twitter_search(limit, search_term)
    rest_connector.search(search_term, result_type: "recent").take(limit).each do |tweet|
      puts "\n"
      p "#{tweet.user.screen_name} user has #{tweet.user.followers_count} followers; says this about #{search_term} - #{tweet.text}"
      puts "\n"
      sleep(1)
    end
  end

end

sadb = SearchAndDestroyBot.new
sadb.twitter_search(10, "bonkers the cat")
