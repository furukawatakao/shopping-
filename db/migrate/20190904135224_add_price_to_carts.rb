class AddPriceToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :price, :string
  end
end
