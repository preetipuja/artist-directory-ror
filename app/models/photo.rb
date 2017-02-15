class Photo < ApplicationRecord
  belongs_to :artist
  validates :title, length: { maximum: 100 }
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
