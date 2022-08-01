class ApplicationController < ActionController::Base
  before_action :set_main_conversation

  private
  def set_main_conversation
    @conversation = Conversation.first
  end
end
