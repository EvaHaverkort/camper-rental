class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show] # you skip it only for these two 

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user # user_id = current_user.id
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if Offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render 'edit', status: :unprocessable_entities
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :price, :brand, :description, :availiblity_start_date, :availibility_end_date, :picture_url)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
