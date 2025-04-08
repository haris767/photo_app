class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many :likes
has_many :comments
end
