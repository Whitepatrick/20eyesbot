require 'anemone'
require 'twitter'
require 'open-uri'
require_relative 'globals'
require_relative 'bot_connector'

class TextFileBot < BotConnector

  def initialize
    @url_array = Array.new
    @url
  end

  def get_url_array
    arr = Array.new
    Anemone.crawl(SCRAPE_URL.sample, :threads => 10, :discard_page_bodies => true) do |anemone|
      anemone.skip_links_like /bofh/, /BOFH/
      anemone.on_every_page { |page| arr.push(page.url.to_s)}
    end
    arr
  end

  def get_url_from_url_array
    @url_array = get_url_array
    @url_array.delete_if { |i| i == "http://www.textfiles.com/humor/COMPUTER/BOFH/" }
    @url = @url_array.sample
  end

  def update_with_txt_file
    file_url = open(get_url_from_url_array)
    file_url.each do |file_line|
      rest_connector.update("#{file_line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}  #{HASHTAGS.sample}") unless file_line.chomp.empty?
      p "#{file_line.to_s.strip} #{HASHTAGS.sample} #{HASHTAGS.sample}  #{HASHTAGS.sample}"
      sleep(70)
    end
  rescue Exception => e
    p "Hey @operations_ivy, something bad happened! #{e}"
    rest_connector.update("Hey @operations_ivy, something bad happened! #{e}")
  end

end
tfb = TextFileBot.new
tfb.update_with_txt_file
