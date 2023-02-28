class BurgersController < ApplicationController

  def index
    @burgers = Burger.all
  end

end
