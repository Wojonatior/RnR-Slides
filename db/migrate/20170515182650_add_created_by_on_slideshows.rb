class AddCreatedByOnSlideshows < ActiveRecord::Migration[5.1]
  def change
    add_column :slideshows, :created_by, :string
  end
end
