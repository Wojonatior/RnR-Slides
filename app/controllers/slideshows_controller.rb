class SlideshowsController < ApplicationController
  def index
    @slideshows = Slideshow.all
    render json: @slideshows, status: :ok
  end
end
