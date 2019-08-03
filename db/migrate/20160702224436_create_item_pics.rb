class CreateItemPics < ActiveRecord::Migration[5.1]
  def change
    create_table :item_pics do |t|
      t.string :pic_url
      t.references :item, index: true

      t.timestamps
    end
  end
end
