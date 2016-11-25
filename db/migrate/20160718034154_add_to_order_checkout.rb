class AddToOrderCheckout < ActiveRecord::Migration
  def change
    add_column :order_checkouts, :email, :string
    add_column :order_checkouts, :adress, :string
    add_column :order_checkouts, :city, :string
    add_column :order_checkouts, :state, :string
    add_column :order_checkouts, :zip, :integer
    add_column :order_checkouts, :phone, :string
    add_column :order_checkouts, :instructions, :text
    
    add_column :order_checkouts, :bill_name, :string
    add_column :order_checkouts, :bill_adress, :string
    add_column :order_checkouts, :bill_city, :string
    add_column :order_checkouts, :bill_state, :string
    add_column :order_checkouts, :bill_zip, :integer
    
    
  end
end
