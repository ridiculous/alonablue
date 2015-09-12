class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @current_page = :contact
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      ReservationMailer.reservation(@reservation).deliver
      redirect_to contact_path, notice: "Thank you for contacting us. We'll get back to you at our earliest convenience."
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
