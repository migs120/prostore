class AddNameToItemPics < ActiveRecord::Migration[5.1]
  def change
    add_column :item_pics, :name, :string
    add_column :item_pics, :description, :text
  end
end
