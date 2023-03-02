class ReviewsController < ApplicationController

  before_action :set_burger, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.burger = @burger
    if @review.save
      redirect_to burger_path(@burger)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to burger_path(@review.burger)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to request.referer
  end

  private

  def set_burger
    @burger = Burger.find(params[:burger_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
