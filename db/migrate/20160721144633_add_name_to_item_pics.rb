class AddNameToItemPics < ActiveRecord::Migration
  def change
    add_column :item_pics, :name, :string
    add_column :item_pics, :description, :text
  end
end
