# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  body            :string
#  user_id         :integer
#  conversation_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
