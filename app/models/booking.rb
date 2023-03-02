class Booking < ApplicationRecord
  belongs_to :burger
  belongs_to :user

  # Date validations
  validate :booking_in_future?
  validate :minimum_one_day?
  validate :start_before_end?
  validate :valid_period?

  private

  def valid_period?
    burger_bookings = Booking.where(burger: burger)

    burger_bookings.each do |booking|
      current_booking_period = (booking.start_date..booking.end_date)

      if current_booking_period.include?(start_date + 1) && errors.empty?
        errors.add(:start_date, "Another booking already starts in this period.")
      elsif current_booking_period.include?(end_date - 1) && errors.empty?
        errors.add(:end_date, "Another booking already ends in this period.")
      end
    end

    # burger_bookings.each do |booking|
    #   current_booking_period = (booking.start_date..booking.end_date)

    #   if (current_booking_period.include?(new_booking_period) ||
    #       new_booking_period.include?(current_booking_period)) &&
    #       errors.empty?
    #     errors.add(:start_date, "There already is a booking in this period.")
    #     errors.add(:end_date, "There already is a booking in this period.")
    #   end
    # end
  end

  def minimum_one_day?
    if start_date == end_date && errors.empty?
      errors.add(:start_date, "Invalid period. Select two different days.")
      errors.add(:end_date, "Invalid period. Select two different days.")
    end
  end

  def start_before_end?
    if start_date > end_date && errors.empty?
      errors.add(:start_date, "Invalid period. Your start date must be before your end date.")
      errors.add(:end_date, "Invalid period. Your end date must be after your start date.")
    end
  end

  def booking_in_future?
    if start_date < Date.today && errors.empty?
      errors.add(:start_date, "Invalid period. Your start date can't be in the past.")
    end

    if end_date < Date.today && errors.empty?
      errors.add(:end_date, "Invalid period. Your end date can't be in the past.")
    end
  end

end
