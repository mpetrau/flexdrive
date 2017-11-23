class OffersController < ApplicationController
  def index
    @offers = Offer.all

    respond_to do |format|
      format.html
      format.json { render json: @offers.to_json }
    end
  end

  def show
  end
end
