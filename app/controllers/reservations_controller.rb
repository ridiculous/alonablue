class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to new_reservation_path, notice: "Thank you for contacting us. We'll get back to you at our earliest convenience."
    else
      request.flash[:errors] = @reservation.errors.full_messages
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit!
  end
end
