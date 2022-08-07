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

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, optional: true

  broadcasts_to :conversation
  after_save :update_text_conversation

  private
  def update_text_conversation
    if conversation.text
      text = conversation.text + ' ' + body
    else
      text = body
    end
    turn = user_id.present? ? 'machine' : 'user'
    conversation.update(text: text, turn: turn)
  end
end
