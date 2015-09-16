require 'twitter'
require_relative 'connector'

class Searcher < Connector

  def initialize(search_term)
    @search_term = search_term
    @limit = 3
  end

  def twitter_search
    rest_connector.search(@search_term, result_type: "recent")
  end

  def print_twitter_search_results
    twitter_search.take(@limit).each do |tweet|
      tweet
    end
  end

end
