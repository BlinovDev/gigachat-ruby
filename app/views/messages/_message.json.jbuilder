json.extract! message, :id, :user_id, :chat_id, :content, :created_at, :updated_at
json.url message_url(message, format: :json)
