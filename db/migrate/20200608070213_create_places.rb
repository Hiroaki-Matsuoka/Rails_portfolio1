class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :message
      t.string :image_name
      t.string :image

      t.timestamps
    end
  end
end
