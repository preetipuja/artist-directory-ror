class User < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
  validates :name, presence: true,length: { maximum: 50 }
  validates :email,  uniqueness:true, presence: true,length: { maximum: 250 }
  has_secure_password
  validates :password, presence: true,length: { minimum: 6 }
end
