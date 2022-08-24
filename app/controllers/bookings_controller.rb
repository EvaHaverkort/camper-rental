class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  # def show
  #   @booking = Booking.find(params[:id])
  # end

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    raise
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.offer_id = @offer.id
    @booking.user_id = current_user.id
    # @booking.final_price = @offer.price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
