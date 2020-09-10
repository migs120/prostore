class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :body
      t.references :main_category, index: true

      t.timestamps
    end
  end
end
