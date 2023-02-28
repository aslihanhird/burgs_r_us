class BurgersController < ApplicationController

  def index
    @burgers = Burger.all
  end

  def show
    @burger = Burger.find(params[:id])
  end

  def new
    @burger = Burger.new
  end

  def create
    @burger = Burger.new(burger_params)
    @current_user = current_user
    @burger.user_id = current_user.id
    if @burger.save
      redirect_to burger_path(@burger)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def burger_params
    params.require(:burger).permit(:name, :description, :user_id)
  end

end
