class AddUrlseedToMainCategoryPics < ActiveRecord::Migration
  def change
    add_column :main_category_pics, :urlseed, :string
  end
end
