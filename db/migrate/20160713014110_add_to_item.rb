class AddToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :price, :integer
    add_column :items, :active, :boolean
    
  end
end
