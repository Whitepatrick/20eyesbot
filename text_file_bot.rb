require 'anemone'
require 'twitter'
require 'open-uri'
require_relative 'credentials'
require_relative 'hashtags'

=begin
Text File Bot LIVES!
This bot does:
- takes a predefined url stored in a global variable (SCRAPE_URL)
- returns an array of all links (files) on page
- grabs a random text file url from the url array
- begins a tweet cycle that tweets every line and sleeps for a b
=end

SCRAPE_URL = "http://www.textfiles.com/humor/COMPUTER/"


class TextFileBot

  def initialize
    @url_array = Array.new
    @url
  end

  def rest_connector
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
  end

  def get_url_array
    arr = Array.new
    Anemone.crawl(SCRAPE_URL, :discard_page_bodies => true) do |anemone|
      anemone.on_every_page { |page| arr.push(page.url.to_s)}
    end
    return arr
  end

  def get_url_from_url_array
    @url_array = self.get_url_array
    @url_array.delete_if { |i| i == "http://www.textfiles.com/humor/COMPUTER/BOFH/" }
    @url = @url_array.sample
  end

  def update_with_txt_file(sleep_time)
    file_url = open(get_url_from_url_array)
    file_url.each do |file_line|
      rest_connector.update("#{file_line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}  #{HASHTAGS.sample}")
      p "#{file_line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}  #{HASHTAGS.sample}"
      sleep(sleep_time)
    end
  end

end
tfb = TextFileBot.new
tfb.update_with_txt_file(0.5)
