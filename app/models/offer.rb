class Offer < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
end
