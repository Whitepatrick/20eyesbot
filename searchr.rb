require 'twitter'
require_relative 'connector'

class Searcher < Connector

  def initialize(limit, search_term)
    @search_term = search_term
  end

  def twitter_search
    rest_connector.search(@search_term, result_type: "recent")
  end

  def process_twitter_search_results
    twitter_search.each do |tweet|
      p tweet.text
    end
  end

end
