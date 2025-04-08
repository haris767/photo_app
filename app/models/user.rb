class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :photos, dependent: :destroy

  # Following relationships
  has_many :follows, foreign_key: :follower_id
  has_many :followings, through: :follows, source: :followed

  # Follower relationships
  has_many :reverse_follows, class_name: "Follow", foreign_key: :followed_id
  has_many :followers, through: :reverse_follows, source: :follower
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

# app/models/user.rb

has_many :sent_friend_requests, class_name: "FriendRequest", foreign_key: "sender_id", dependent: :destroy
has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "receiver_id", dependent: :destroy

# For convenience
has_many :pending_sent_requests, -> { where(status: "pending") }, class_name: "FriendRequest", foreign_key: "sender_id"
has_many :pending_received_requests, -> { where(status: "pending") }, class_name: "FriendRequest", foreign_key: "receiver_id"

# Accepted friends
def friends
  FriendRequest.where("(sender_id = ? OR receiver_id = ?) AND status = ?", id, id, "accepted").map do |fr|
    fr.sender == self ? fr.receiver : fr.sender
  end
end
end
