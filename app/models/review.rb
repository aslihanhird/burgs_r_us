class Review < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 10 }

  validates :rating, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

end
