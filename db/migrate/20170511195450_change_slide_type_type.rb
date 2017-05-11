class ChangeSlideTypeType < ActiveRecord::Migration[5.1]
  def change
    change_column :slides, :slide_type, :string
  end
end
