class CreateOrderCheckoutTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :order_checkout_transactions do |t|
      t.references :order_checkout, index: true
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps
    end
  end
end
