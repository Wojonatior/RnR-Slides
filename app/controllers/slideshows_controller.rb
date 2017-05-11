class SlideshowsController < ApplicationController
  before_action :set_slideshow, only: [:show, :update, :destroy]

  def index
    @slideshows = Slideshow.all
    json_response(@slideshows)
  end

  def show
    json_response(@slideshow)
  end

  private
  
  def set_slideshow
    @slideshow = Slideshow.find(params[:id])
  end
end
