class ConversationsController < ApplicationController
  def show
  end

  def update
    _text = params[:conversation][:text] + ' ' + params[:conversation][:message]
    respond_to do |format|
      if @conversation.update(text: _text)
        format.html { redirect_to conversation_path(@conversation) }
        format.json { render :show, status: :ok, location: @conversation }
        #@conversation.broadcast_replace_to 'my_chanel', target: "conversation_#{@conversation.id}", partial: "conversations/conversation", locals: { conversation: @conversation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end
end
