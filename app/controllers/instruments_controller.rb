class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @instruments = Instrument.all

    if params[:query].present?
      @instruments = @instruments.search_by_title_description(params[:query])
    end

    if params[:location].present?
      @instruments = @instruments.near(params[:location], 50)
    end

    if params[:category].present?
      @instruments = Instrument.search_by_category(params[:category])
    end

  end

  def show
    @rental = Rental.new
    @instrument = Instrument.find(params[:id])
    @instruments = Instrument.where.not(latitude: nil, longitude: nil)
    @instrument_coordinates = { lat: @instrument.latitude, lng: @instrument.longitude }
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument)
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
    respond_to do |format|
            format.html { redirect_to list_user_instruments_path(current_user) }
            format.js  # <-- idem
          end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:title, :description, :location, :price, :photo, :category_id)
  end

end
