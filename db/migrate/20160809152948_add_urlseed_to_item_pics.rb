class AddUrlseedToItemPics < ActiveRecord::Migration
  def change
    add_column :item_pics, :urlseed, :string
  end
end
