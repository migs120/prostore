class AddUrlseedToItemPics < ActiveRecord::Migration[5.1]
  def change
    add_column :item_pics, :urlseed, :string
  end
end
