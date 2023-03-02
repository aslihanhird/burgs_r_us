class BurgersController < ApplicationController
  before_action :current_burger, only: %i[edit update show destroy]
  before_action :can_review?, only: [:show]

  def index
    @burgers = Burger.all
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @burger = Burger.new
  end

  def create
    @burger = Burger.new(burger_params)
    @burger.user_id = current_user.id

    if @burger.save
      redirect_to burger_path(@burger)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @burger.update(burger_params)
      redirect_to edit_burger_path(@burger)
      flash.notice = "Picture(s) added succesfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @burger.user
      @burger.destroy
      flash.alert = "Burger has been deleted succesfully."
    else
      flash.alert = "You are not allowed to delete this burger."
    end

    redirect_to root_path
  end

  private

  def current_burger
    @burger = Burger.find(params[:id])
  end

  def burger_params
    params.require(:burger).permit(:name, :description, :user_id, photos: [])
  end

  def can_review?
    if current_user
      @can_review = Booking.where(user_id: current_user.id, burger_id: @burger.id ).any? && Review.where(user_id: current_user.id, burger_id: @burger.id ).empty?
    end
  end
end
