class AddTurnToConversation < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :turn, :string
  end
end
