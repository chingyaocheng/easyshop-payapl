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
#  quantity    :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
