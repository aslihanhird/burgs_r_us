class BurgersController < ApplicationController
  before_action :current_burger, only: %i[edit update show destroy]
  before_action :can_review?, only: [:show]

  def index
    if params[:query].present?
      sql_query = "name @@ :query OR description @@ :query"
      @burgers = Burger.where(sql_query, query: "%#{params[:query]}%")
      if @burgers.present? == false
        redirect_to root_path
        flash.notice = "#{params[:query]} does not exists"
      end
    else
      @burgers = Burger.all
    end
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

  def delete_picture
    burger = Burger.find(params[:burger_id].to_i)
    photo = burger.photos[params[:picture_index].to_i]
    photo.purge
    flash.alert = "Picture deleted succesfully! ✅"
    redirect_to request.referer
  end

  private

  def current_burger
    @burger = Burger.find(params[:id])
  end

  def burger_params
    params.require(:burger).permit(:name, :description, :user_id, photos: [])
  end

  def can_review?
    @can_review = user_signed_in? && Booking.where(user_id: current_user.id, burger_id: @burger.id ).any? && Review.where(user_id: current_user.id, burger_id: @burger.id ).empty? && booking_ended?
  end

  def booking_ended?
    booking = Booking.where(user_id: current_user.id, burger_id: @burger.id).last
    days = (Date.today - booking.end_date).to_i
    days >= 0
  end
end
