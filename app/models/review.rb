class Review < ApplicationRecord
  belongs_to :burger
  belongs_to :user
end
