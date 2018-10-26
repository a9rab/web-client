class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
  has_many :positions
  belongs_to :family
  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
     existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def last_known_location
    positions.limit(1)[0]
  end

end
