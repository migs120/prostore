class AddPurchaseToOrderCheckout < ActiveRecord::Migration
  def change
    add_column :order_checkouts, :purchased_at, :date
  end
end
