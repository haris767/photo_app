class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
