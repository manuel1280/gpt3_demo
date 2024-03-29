# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  turn       :string
#

class Conversation < ApplicationRecord
  require './lib/gpt3'
  has_many :messages
  #broadcasts_to :itself
  after_save {broadcast_replace_to "messages"}
  after_update :gpt3_response

  def clean_text
    messages.destroy_all
    self.update(text: nil)
  end

  private

  def gpt3_response
    if turn == 'machine'
      message = Gpt3.completions(self.text)
      self.messages.create(body: message)
    end
  end
end
