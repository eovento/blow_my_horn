class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
    @instrument = Rental.find(params[:id]).instrument
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to rental_path(@rental)
    else
      render :edit
    end
  end

  def destroy
    @rental.destroy
    redirect_to rentals_index
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:user_id, :start_date, :end_date, :instrument_id)
  end

end
