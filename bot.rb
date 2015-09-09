require 'twitter'
require_relative 'credentials'

class BotConnector
  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end
  def stream_connector
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  ##################
  # STREAM METHODS #
  ##################
  def twitter_stream
    friend_list = Twitter::Streaming::FriendList
    stream_connector.user(friend_list).collect do |tweet|
      p tweet.text
    end
  end

  ##################
  #  REST METHODS  #
  ##################
  def twitter_search(limit, search_term, options)
    rest_connector.search(search_term, options).take(limit).each do |tweet|
      p tweet.text
      p "*" * 10
    end
  end

  def get_follower_ids
    follower_list = rest_connector.follower_ids
    #follower_list.each do |follower_id|
      #rest_connector.follow(follower_id)
      #p "#{follower_id}"
    #end
    p follower_list
  end

  def update_with_txt_file
    bed_time = 43200
    hashtags = "#followback #mileycyrus #guyfieri #followforfollow"
    txt_file = File.open("txt_files/tagline.s")

    txt_file.each do |line|
      #rest_connector.update("#{line.strip} #{hashtags}")
      p "Now tweeting #{line.strip} #{hashtags}"
      sleep(bed_time)
    end
  end
end

bc = BotConnector.new
bc.get_follower_ids
#bc.twitter_search(10, "greg kumparak", result_type: "recent")
#bc.twitter_stream
# live stream 573999415
