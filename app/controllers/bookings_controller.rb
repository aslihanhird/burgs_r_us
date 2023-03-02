class BookingsController < ApplicationController
  before_action :set_burger, only: %i[create show]
  before_action :all_bookings, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.burger = @burger

    if @booking.save
      redirect_to burger_path(@burger)
    else
      if @booking.errors.messages.present?
        puts "---------------------"
        p @booking.errors.messages[:base].first
        puts "---------------------"
      end
      render 'burgers/show', status: :unprocessable_entity

    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = current_user.bookings
  end

  private

  def set_burger
    @burger = Burger.find(params[:burger_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def all_bookings
    @all_bookings = Booking.all
  end

end
