class Video
  require 'hulu.rb'

  # to get access to model_name, singular, plural support
    extend ActiveModel::Naming
  #
  # to get access to internationalization
  #  extend ActiveModel::Translation
  #
  # to get conversion support
   include ActiveModel::Conversion
  #
  # to get serialization support
  #  include ActiveModel::Serialization
  #
  # attribute methods
  #  include ActiveModel::AttributeMethods
  #
  # validations support
    include ActiveModel::Validations

		
  # to get conversion support
     include ActiveModel::Conversion
  #
  # to get serialization support
  #  include ActiveModel::Serialization
  #
  # attribute methods
  #  include ActiveModel::AttributeMethods
  #
  # validations support
    include ActiveModel::Validations

  attr_accessor :title, :short_description, :description, :thumbnail_url, :show_name, :programming_type, :description, :genre, :name, :is_movie, :is_feature_film
   ELEMENT_LIST = ["title", "short_description", "description", "thumbnail_url", "show_name", "programming_type", "description", "genre", "name", "is_movie", "is_feature_film"]

  def initialize(attributes = {})
    attributes.each do |name, value|
     send("#{name}=", value) if ELEMENT_LIST.include?(name)
    end
    #@title = attributes["title"]
    #@short_desctiption = attributes["description"] 
    #@thumbnail_url = attributes["thumbnail_url"]
    #@show_name = attributes["show_name"]
    #@programming_type = attributes["programming_type"]
    #@desctiption = attributes["show"]["description"]
    #@genre = attributes["show"]["genre"]
    #@name = attributes["show"]["name"]
    #@is_movie = attributes["show"]["is_movie"]
    #@is_feature_film = attributes["show"]["is_feature_film"]
  end

  def self.video_list(query_str, item_per_page=nil, page=nil)
	return_video_list = []
    response_list = Hulu.movie_list(query_str, item_per_page,page)
    return self.create_movie_list(response_list,return_video_list)    
  end


  private
  def self.create_movie_list(params, movie_list)
         
        params["results"]["videos"].each do |value|
         new_obj = self.new(value)
	 movie_list << new_obj
        end
        return movie_list 
   end

end
