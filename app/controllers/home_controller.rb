class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to conversation_path(Conversation.last.id) and return
    end
  end
end
