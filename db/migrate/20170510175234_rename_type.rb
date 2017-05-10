class RenameType < ActiveRecord::Migration[5.1]
  def change
    rename_column :slides, :type, :slide_type
  end
end
