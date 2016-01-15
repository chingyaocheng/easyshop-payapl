# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#  product_id :integer
#  price      :integer
#  amount     :integer
#  quantity   :integer
#

class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  QUANTITY = (1..10)

  def total_price
    product.price * self.quantity.to_i
  end


end
