# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  body       :text
#  category   :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
