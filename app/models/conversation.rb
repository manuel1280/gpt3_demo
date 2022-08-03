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
  broadcasts_to :itself
  #after_update {broadcast_replace_to "my_chanel"}
end
