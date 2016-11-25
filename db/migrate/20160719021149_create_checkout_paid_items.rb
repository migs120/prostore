class CreateCheckoutPaidItems < ActiveRecord::Migration
  def change
    create_table :checkout_paid_items do |t|
      t.string :title
      t.string :name
      t.integer :price
      t.text :body
      t.references :order_checkout, index: true

      t.timestamps
    end
  end
end
