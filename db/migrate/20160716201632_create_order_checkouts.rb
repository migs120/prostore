class CreateOrderCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_checkouts do |t|
      t.references :order, index: true
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on

      t.timestamps
    end
  end
end
