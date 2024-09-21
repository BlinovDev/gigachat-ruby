require 'digest'

class User < ApplicationRecord
  has_many :chat_users
  has_many :chats, through: :chat_users

  has_many :messages

  # Validations
  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true

  # Callbacks to handle password encryption
  before_save :encrypt_password

  # Authenticate method to verify password
  def authenticate(plain_password)
    self.password == Digest::SHA512.hexdigest(plain_password)
  end

  private

  def encrypt_password
    if password.present?
      self.password = Digest::SHA512.hexdigest(password)
    end
  end
end
