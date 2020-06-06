class AddItemMessageToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :message, :text
  end
end
