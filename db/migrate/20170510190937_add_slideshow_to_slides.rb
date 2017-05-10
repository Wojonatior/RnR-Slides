class AddSlideshowToSlides < ActiveRecord::Migration[5.1]
  def change
    add_reference :slides, :slideshow, foreign_key: true
  end
end
