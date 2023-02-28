class BookingsController < ApplicationController

  before_action :set_burger, only: %i[new create show]


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.burger = @burger
    if @booking.save
      redirect_to burger_path(@burger)
    else
      render :new, status: :unprocessable_entity
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

end
