class Category < ApplicationRecord
  has_many :artists, dependent: :nullify
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 },format: { with: /\A[a-zA-Z]\D/,
    message: "Only letters is allowed" }
end

