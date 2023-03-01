class Booking < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  # def valid_date?


  #   Booking.all do |booking|
  #     # If the start date is after the ending, there is no problem
  #     if self.start_date < booking.end_date
  #       if self.end_date
  #     end
  #   end

  #   # If the start date is after a start date from the bookings

  #   # Check if the end date matches
  #   self.start_date

  #   return true
  # end
end
