class CreateSlideshows < ActiveRecord::Migration[5.1]
  def change
    create_table :slideshows do |t|
      t.string :title
      t.integer :length

      t.timestamps
    end
  end
end
