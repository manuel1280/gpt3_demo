class MessagesController < ApplicationController
  def create
    message = @conversation.messages.build(body: params[:message][:body], user_id: current_user.id)
    if message.save
      redirect_to @conversation
      #@conversation.broadcast_replace_to 'conversations', target: "conversation_#{@conversation.id}", partial: "conversations/conversation", locals: { conversation: @conversation }
    end
  end
end
