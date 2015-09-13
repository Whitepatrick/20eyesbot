require 'anemone'
require 'twitter'
require 'open-uri'
require_relative 'globals'
require_relative 'bot_connector'

class TextFileBot < BotConnector

  def initialize
    @url_array = Array.new
  end

  def crawl_for_urls
    SCRAPE_URL.each do |scrape_url|
      Anemone.crawl(scrape_url, :threads => 10, :discard_page_bodies => true) do |anemone|
        anemone.skip_links_like /bofh/, /BOFH/
        anemone.on_every_page { |page| @url_array.push(page.url.to_s)}
      end
    end
    @url_array = @url_array - SCRAPE_URL
  end

  def tweet_lines
    crawl_for_urls.each do |url|
      file_url = open(url)
      file_url.each do |line|
        rest_connector.update("#{line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}") unless line.chomp.empty?
        p "#{line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}" unless line.chomp.empty?
        sleep(120)
      end
    end
  rescue Exception => e
    p "Hey @operations_ivy, something bad happened! #{e}"
    rest_connector.update("Hey @operations_ivy, something bad happened! #{e}")
  end
end

cf = TextFileBot.new
#cf.crawl_for_urls
cf.tweet_lines
