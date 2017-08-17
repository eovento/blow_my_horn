class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy, :confirm]

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @instrument = Instrument.find(params[:instrument_id])
    @rental.instrument = @instrument
    if @rental.save
      redirect_to instrument_path(@instrument), notice: "Rental created sucessfully"
    else
      #flash.now[:alert] = @rental.errors.full_messages.join(", ")
      render "instruments/show"
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :instrument_id)
  end

end
