require 'anemone'
require 'twitter'
require 'open-uri'
require_relative 'credentials'

SCRAPE_URL = "http://www.textfiles.com/humor/COMPUTER/"
HASHTAGS = ['#followback', '#followforfollow', '#ftw',
            '#taylorswift', '#trump2016','#tfw',
            '#guyfieri', "#bieber", '#onedirection',
            '#followme']

class TextFileBot
  def initialize
    @url_array = Array.new
  end

  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def crawl_for_urls
    Anemone.crawl(SCRAPE_URL, :discard_page_bodies => true) do |anemone|
      anemone.on_every_page { |page| @url_array.push(page.url.to_s)}
    end
    @url_array.shift(5)
  end

  def update_with_txt_file(selected_url, sleep_time)
    txt_file = open(selected_url.sample)
    txt_file.each do |line|
      #rest_connector.update("#{line.strip} #{hashtags}")
      p "Now tweeting #{line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}"
      sleep(sleep_time)
    end
  end
end

tfb = TextFileBot.new
#tfb.crawl_for_urls
file_to_scrape = tfb.crawl_for_urls
tfb.update_with_txt_file(file_to_scrape)
