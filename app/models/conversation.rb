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
  has_many :messages

  #broadcasts_to :itself
  #after_update {broadcast_replace_to "my_chanel"}
  #after_save :gpt3_response

  private
  def gpt3_response
    message = Gpt3.completions(self.text)
  end
end
