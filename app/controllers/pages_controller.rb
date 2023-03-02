class PagesController < ApplicationController
  def home
  end

  def profile
    @profile = User.find_by(username: params[:username])

    if current_user != @profile
      flash.alert = "You are not authorized to view this profile."
      redirect_to root_path
    end

  end
end
