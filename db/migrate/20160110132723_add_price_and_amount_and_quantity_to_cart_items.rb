class AddPriceAndAmountAndQuantityToCartItems < ActiveRecord::Migration
  def change
    add_column :cart_items, :price, :integer
    add_column :cart_items, :amount, :integer
    add_column :cart_items, :quantity, :integer
  end
end
