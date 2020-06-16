class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :title
      t.integer :price
      t.text :message
      t.string :image_name

      t.timestamps
    end
  end
end
