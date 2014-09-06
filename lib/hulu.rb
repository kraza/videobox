module Hulu
  require 'httparty'
  require 'net/http'
  include HTTParty
  base_uri "m.hulu.com/search"

  def self.movie_list(query_string, items_per_page=10, page=1)
    response = get("/?dp_identifier=hulu&query=#{query_string}&items_per_page=#{items_per_page}&page=#{page}")
    if response.success?
      response
    else
      raise response.response
    end
  end
end
