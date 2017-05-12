class SlidesController < ApplicationController
  before_action :set_slideshow
  before_action :set_slide, only: [:show, :update, :destroy]

  def index
    json_response(@slideshow.slides)
  end

  def show
    json_response(@slide)
  end

  def create
    @slideshow.slides.create!(slide_params)
    json_response(@slideshow.slides.last, :created)
  end

  def update
    @slide.update!(slide_params)
    head :no_content
  end

  def destroy
    @slide.destroy
    head :no_content
  end

  private

  def slide_params
    params.permit(:title, :slide_type)
  end

  def set_slideshow
    @slideshow = Slideshow.find(params[:slideshow_id])
  end

  def set_slide
    @slide = @slideshow.slides.find_by!(id: params[:id]) if @slideshow
  end
end
