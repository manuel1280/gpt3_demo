class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def clean
    @conversation.clean_text
    redirect_to @conversation
  end
end
