class UsersProfilesController < ApplicationController

  def profile
    @user = User.find(params[:id])
  end

  def instruments
    # @instruments = current_user.instruments
    @user = User.find(params[:id])
  end

  def rentals
    @user = User.find(params[:id])
  end

end
