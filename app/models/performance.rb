class Performance < ApplicationRecord
  belongs_to :artist
  validates :media_url, presence: true, length: { maximum: 250 },format: { with: /\A[a-zA-Z]\D/,
    message: "Only letters is allowed" }
  validates :title, length: { maximum: 300}
end
