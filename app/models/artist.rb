class Artist < ApplicationRecord
  belongs_to :category
  has_many :performances, inverse_of: :artist, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  accepts_nested_attributes_for :performances
  validates :name, presence: true,length: { maximum: 50 }, format: { with: /\A[a-zA-Z]/,
    message: "Only letters are allowed" }
  validates :email,  uniqueness:true, presence: true,length: { maximum: 250 }
  validates :location, presence: true,length: { maximum: 500 },format: { with: /\A[a-zA-Z]\D/,
    message: "Only letters are allowed" }
  validates_date :year_of_birth, :before => lambda { 18.years.ago },
  :before_message => "must be at least 18 years old"

  def avg_rating
    return 0 if feedbacks.empty?
    total_rating = feedbacks.pluck(:rating).inject(0) { |value, rating| value + rating }
    total_rating / feedbacks.count.to_f
  end
end

