class AddShippedToOrderCheckout < ActiveRecord::Migration[5.1]
  def change
    add_column :order_checkouts, :paid_shipped_n_done, :boolean
  end
end
