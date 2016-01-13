# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Product < ActiveRecord::Base
  belongs_to :category
  has_many :assets
  has_many :cart_items
  has_many :carts, :through => :cart_items
  mount_uploader :image, ImageUploader

  has_many :order_items
  has_many :orders, :through => :order_items

end
