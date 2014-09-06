class Aggregator < ActiveRecord::Base
#class Aggregator < ActiveRecord::Base
  include HTTParty
  require 'net/http'
  attr_accessor :name, :description, :thumbnail, :title, :genre
  require 'resolv-replace.rb'  
  #base_uri "rubygems.org/api/v1"
  base_uri "m.hulu.com/search"
  #DP_IDENTIFIER = "hulu"

  def initialize(attributes = {})
    @name = attributes[:name]
    @info = attributes[:description]
    @thumbnail = attributes[:thumbnail]
    @title = attributes[:title]
    @genre = attributes[:genre]
    # now do your own initialization
  end  
  #response =  HTTParty.get("http://m.hulu.com/search/?dp_identifier=hulu&query=dil%20se&items_per_page=10&page=1")
  #response =  HTTParty.get("http://rubygems.org/api/v1/versions/httparty.json")
  #RemoteGem.find("httparty")
#  def initialize(name, info, version, authors, downloads)
#    self.name = name
#    self.info = info
#    self.version = version
#    self.authors = authors
#    self.downloads = downloads
#  end
  
  
#  # Returns the versions for this particular RemoteGem
#  def versions
#    response = self.class.get("/versions/#{name}.json")
#    if response.success?
#      response
#    else
#      raise response.response
#    end
#  end
  
  def self.hulu
    query = "dil"
    items_per_page=10
    page=1
    url_response = get("/?dp_identifier=hulu&query=#{query}&items_per_page=#{items_per_page}&page=#{page}")
    count = url_response["results"]["count"]

    if response.success?
      response
    else
      raise response.response
    end
  end
  
#  # Find a particular gem, based on its name
#  def self.find(name)
#    response = get("/gems/#{name}.json")
#    if response.success?
#      self.new(response["name"], response["info"], response["version"],
#         response["authors"], response["downloads"])
#    else
#      # this just raises the net/http response that was raised
#      raise response.response
#    end
#  end
#  
  
  
end
