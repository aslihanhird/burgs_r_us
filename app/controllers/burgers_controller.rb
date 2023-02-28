class BurgersController < ApplicationController
  before_action :current_burger, only: %i[edit update show]

  def index
    @burgers = Burger.all
  end

  def show; end

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
      redirect_to burger_path(@burger)
    else
      render edit_burger_path, status: :unprocessable_entity
    end
  end

  private

  def current_burger
    @burger = Burger.find(params[:id])
  end
  def burger_params
    params.require(:burger).permit(:name, :description, :user_id, photos: [])
  end
end
