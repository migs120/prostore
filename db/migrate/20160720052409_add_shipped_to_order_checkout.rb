class AddShippedToOrderCheckout < ActiveRecord::Migration
  def change
    add_column :order_checkouts, :paid_shipped_n_done, :boolean
  end
end
