class SlideshowsController < ApplicationController
  before_action :set_slideshow, only: [:show, :update, :destroy]

  def index
    @slideshows = Slideshow.all
    json_response(@slideshows)
  end

  def show
    json_response(@slideshow)
  end

  def create
    @slideshow = Slideshow.create!(slideshow_params)
    json_response(@slideshow, :created)
  end


  private

  def slideshow_params
    params.permit(:title)
  end
  
  def set_slideshow
    @slideshow = Slideshow.find(params[:id])
  end
end
