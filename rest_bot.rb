require 'twitter'
require_relative 'credentials'

class RESTClient
  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  # returns 3 recent tweets of term provided
  def twitter_search(search_term, options)
    rest_connector.search(search_term, options).take(3).each do |tweet|
      p tweet.text
      p "*" * 10
    end
  end

  def follow_followers
    bed_time = 3600
    rest_connector.follower_ids.each do |follower_id|
      #rest_connector.follow(follower_id)
      p "Now following #{follower_id}"
      sleep(bed_time)
    end
  end

  # sends a tweet
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

rc = RESTClient.new

rest_threads = []
rest_threads << Thread.new { rc.update_with_txt_file }
rest_threads << Thread.new { rc.follow_followers }

rest_threads.each { |i| i.join }
