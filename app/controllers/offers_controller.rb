class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update]

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @offer.destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :price)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
