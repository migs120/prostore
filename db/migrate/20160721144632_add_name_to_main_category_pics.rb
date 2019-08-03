class AddNameToMainCategoryPics < ActiveRecord::Migration[5.1]
  def change
    add_column :main_category_pics, :name, :string
    add_column :main_category_pics, :description, :text
  end
end
