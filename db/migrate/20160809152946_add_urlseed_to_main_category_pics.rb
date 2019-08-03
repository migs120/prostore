class AddUrlseedToMainCategoryPics < ActiveRecord::Migration[5.1]
  def change
    add_column :main_category_pics, :urlseed, :string
  end
end
