# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ApplicationRecord
  require './lib/gpt3'
  validates :text, presence: true
  attr_accessor :message
  after_create_commit {broadcast_append_to "conversation"}
end
