class AddToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :name, :string
    add_column :items, :price, :integer
    add_column :items, :active, :boolean
    
  end
end
