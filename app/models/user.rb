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
  has_many :likes
  has_many :comments
end
