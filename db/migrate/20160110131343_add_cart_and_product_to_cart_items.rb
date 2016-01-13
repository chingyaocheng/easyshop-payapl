class AddCartAndProductToCartItems < ActiveRecord::Migration
  def change
    add_reference :cart_items, :cart, index: true, foreign_key: true
    add_reference :cart_items, :product, index: true, foreign_key: true
  end
end
