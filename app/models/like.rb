class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :user_id, uniqueness: { scope: :photo_id } # one like per user per photo
end
