# == Schema Information
#
# Table name: assets
#
#  id         :integer          not null, primary key
#  image      :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Asset < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ImageUploader
end
