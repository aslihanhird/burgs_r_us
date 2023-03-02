class Burger < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validate :min_photo_amount, :max_photo_amount

  def average_rating
    reviews = self.reviews
    all_ratings = 0
    reviews.each do |review|
      all_ratings += review.rating
    end
    (all_ratings / reviews.count).round(1)
  end

  private

  def min_photo_amount
    errors.add(:photos, "A burger needs a minimum of 1 photo.") if photos.empty?
  end

  def max_photo_amount
    errors.add(:photos, "A burger can only have a maximum of 5 pictures.") if photos.size > 5
  end
end
