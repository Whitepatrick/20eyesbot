require 'twitter'
require_relative 'bot_connector'

sadb = BotConnector.new.rest_connector
count = 0

sadb.search("trump", result_type: "recent").take(10).each do |tweet|
  p "Username: #{tweet.user.screen_name}"
  p "Followers: #{tweet.user.followers_count}"
  p "Trump Tweet: #{tweet.text}"
  p "Tweet platform: #{tweet.user.source}"
  puts "\n"
  puts "\n"
  sleepy = sleep(1.5)
  count += 1
end
