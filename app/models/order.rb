# == Schema Information
#
# Table name: orders
#
#  id                   :integer          not null, primary key
#  name                 :string
#  ship_to_address      :string
#  phone_number         :string
#  ship_to_name         :string
#  ship_to_phone_number :string
#  status               :string
#  customer_ip          :string
#  email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Order < ActiveRecord::Base
  has_many :order_items
  has_many :products, :through => :order_items

   validates :name, :ship_to_address, :phone_number ,:ship_to_name ,:ship_to_phone_number, presence: true

  STATUS = [
    ["New", :new],
    ["Done", :done]
  ]

  def total
    # order_items.inject(0) {|sum, n| n.price * n.quantity + sum}
    order_items.map(&:total).sum
  end


  def paypal_url(return_path)
        values = {
        business: "bomibar3-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: order_items.map(&:total).sum,
        # item_name: order_item.product.name,
        # item_number: order_item.product_id,
        quantity: '1'
    }
  "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
