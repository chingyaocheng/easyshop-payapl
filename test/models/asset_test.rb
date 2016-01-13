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

require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
