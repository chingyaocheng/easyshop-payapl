class CartController < ApplicationController
before_action :initialize_cart

def add
  @pruduct = Product.find(params[:id])
  @items = @cart.cart_items.where(:product_id => params[:id])

    if @items.size < 1
      ci = @cart.cart_items.create( :product_id => params[:id], :quantity => params[:quantity].to_i)
    else
      ci = @items.first
      ci.quantity = ci.quantity + params[:quantity].to_i
      ci.update_attribute(:quantity , ci.quantity)
    end
  ci
   redirect_to :back, notice: 'Items was successfully added.'
end


def remove
  ci = @cart.cart_items.where(:product_id == params[:id]).first

  if ci
    @cart.cart_items.delete(ci.id)
  end

  redirect_to :back, notice: 'Items was successfully removed.'
end


def destroy
  @cart.cart_items.destroy_all
  redirect_to :back, notice: 'Items was successfully cleared.'
end


end
