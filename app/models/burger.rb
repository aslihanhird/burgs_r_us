class Burger < ApplicationRecord
  belongs_to :user
  has_many :bookings, :reviews, dependent: :destroy
end
