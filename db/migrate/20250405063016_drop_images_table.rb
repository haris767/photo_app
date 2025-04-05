class DropImagesTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :images
    drop_table :payments
  end
end
