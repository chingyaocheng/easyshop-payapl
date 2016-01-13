# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
has_many :cart_items
has_many :products, :through => :cart_items

  def total_amount
    #  sum = 0
    # cart_items.each do |cart_item|
    #   sum += cart_item.price * cart_item.quantity
    # end
    #  sum
    cart_items.inject(0) { |sum, item| sum + item.total_price }
  end
end
