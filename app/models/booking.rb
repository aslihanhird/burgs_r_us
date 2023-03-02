class Booking < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  validate :valid_period?

  private

  def valid_period?
    all_bookings = Booking.all

    all_bookings.each do |booking|
      current_booking_period = (booking.start_date..booking.end_date)
      new_booking_period = (start_date..end_date)

      if current_booking_period.include?(new_booking_period)
        errors.add(:booking, "There already is a booking in this period.")
        break
      end

    end
  end
end
