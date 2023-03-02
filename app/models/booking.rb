class Booking < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  validate :valid_period?
  validate :minimum_one_day?

  private

  def valid_period?
    all_bookings = Booking.where(burger: burger)

    new_booking_period = (start_date..end_date)

    all_bookings.each do |booking|
      current_booking_period = (booking.start_date..booking.end_date)

      if current_booking_period.include?(new_booking_period)
        errors.add(:booking, "There already is a booking in this period.")
      end
    end
  end

  def minimum_one_day?
    if start_date == end_date
      errors.add(:start_date, "Invalid period. Select two different days.")
      errors.add(:end_date, "Invalid period. Select two different days.")
    end
  end

end
