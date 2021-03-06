module Api::V1
  class SlideshowsController < ApplicationController
    before_action :set_slideshow, only: [:show, :update, :destroy]

    def index
      # The option to only return slideshows that belong to a user is also here
      # @slideshows = current_user.slideshows
      @slideshows = Slideshow.all
      json_response(@slideshows)
    end

    def show
      render :json => @slideshow.to_json(:include => :slides)
    end

    def create
      @slideshow = Slideshow.create!(slideshow_params)
      json_response(@slideshow, :created)
    end

    def update
      @slideshow.update!(slideshow_params)
      head :no_content
    end

    def destroy
      @slideshow.destroy
      head :no_content
    end

    private

    def slideshow_params
      params.permit(:title)
    end
    
    def set_slideshow
      @slideshow = Slideshow.find(params[:id])
    end
  end
end
