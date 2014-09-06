class HomeController < ApplicationController
  def index
    @response = Video.video_list("xmen")
  end
end
