# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  phone      :string(255)
#  code       :string(255)
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  license    :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
