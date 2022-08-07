class ConversationsController < ApplicationController
  def show
  end

  def clean
    @conversation.clean_text
    redirect_to @conversation
  end
end
