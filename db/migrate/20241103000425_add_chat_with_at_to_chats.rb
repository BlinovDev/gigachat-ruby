class AddChatWithAtToChats < ActiveRecord::Migration[7.2]
  def change
    add_column :chats, :chat_with, :integer
  end
end
