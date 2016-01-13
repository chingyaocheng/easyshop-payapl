class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def total
    product.price * quantity
  end
end
