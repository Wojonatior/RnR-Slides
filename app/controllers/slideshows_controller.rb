class SlideshowsController < ApplicationController
  before_action :set_slideshow, only: [:show, :update, :destroy]

  def index
    @slideshows = Slideshow.all
    render json: @slideshows, status: :ok
  end

  def show
    render json: @slideshow, status: :ok
  end

  private
  
  def set_slideshow
    @slideshow = Slideshow.find(params[:id])
  end
end
