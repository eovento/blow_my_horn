class InstrumentsController < ApplicationController
  def product_params
    params.require(:product).permit(:name, :description, :photo)
  end
end
