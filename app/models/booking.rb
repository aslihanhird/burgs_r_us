class Booking < ApplicationRecord
  belongs_to :burger
  belongs_to :user
end
