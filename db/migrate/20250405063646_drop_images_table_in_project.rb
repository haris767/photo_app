class DropImagesTableInProject < ActiveRecord::Migration[8.0]
  def change
    drop_table :images
  end
end
