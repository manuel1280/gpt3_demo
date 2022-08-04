class ConversationsController < ApplicationController
  def show
  end

  def clean
    binding.debugger
    @conversation.clean_text
    redirect_to @conversation
  end
end
