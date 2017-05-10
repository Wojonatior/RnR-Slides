class AddSlideToContents < ActiveRecord::Migration[5.1]
  def change
    add_reference :contents, :slide, foreign_key: true
  end
end
