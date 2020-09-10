class AddPurchaseToOrderCheckout < ActiveRecord::Migration[5.1]
  def change
    add_column :order_checkouts, :purchased_at, :date
  end
end
