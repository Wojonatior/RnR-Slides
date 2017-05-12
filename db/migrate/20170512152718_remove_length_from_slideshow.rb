class RemoveLengthFromSlideshow < ActiveRecord::Migration[5.1]
  def change
    remove_column(:slideshows, :length)
  end
end
