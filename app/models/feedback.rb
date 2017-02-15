class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :artist
  validates :review,  length: { maximum: 500 }
  validates :rating,  numericality: { only_integer: true }
  validates :artist_id, presence: true
  validates :user_id, presence: true
end
