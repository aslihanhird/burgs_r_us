class Review < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 10 }

  validates :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  validate :rating_with_full_or_half_numbers?

  private

  def rating_with_full_or_half_numbers?
    if rating.modulo(0.5) != 0
      errors.add(:rating, "You can only rate full or half numbers.")
    end
  end

end
