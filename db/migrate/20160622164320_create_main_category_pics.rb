class CreateMainCategoryPics < ActiveRecord::Migration[5.1]
  def change
    create_table :main_category_pics do |t|
      t.string :pic_url
      t.references :main_category, index: true

      t.timestamps
    end
  end
end
