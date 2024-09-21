json.extract! chat_user, :id, :user_id, :chat_id, :created_at, :updated_at
json.url chat_user_url(chat_user, format: :json)
