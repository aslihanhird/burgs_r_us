class Burger < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many_attached :photos

  def average_rating
    reviews = self.reviews
    all_ratings = 0
    reviews.each do |review|
      all_ratings += review.rating
    end
    (all_ratings / reviews.count).round(1)
  end
end
