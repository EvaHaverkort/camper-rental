class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @offer = Offer.find(params[:offer_id])
    # authorize @offer
    @booking = Booking.new
    authorize @booking # DO I AUTHORIZE BOOKING OR OFFER OR BOTH
  end

  def create
    @offer = Offer.find(params[:offer_id])
    # authorize @offer # why not HERE?
    @booking = Booking.new(booking_params)
    authorize @booking # HERE?
    @booking.offer_id = @offer.id
    @booking.user_id = current_user.id
    # @booking.final_price = @offer.price
    if @booking.save
      flash[:notice] = 'You have successfully booked'
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
