class AddPlaceIdToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :place_id, :integer
  end
end
