class ReservationMailer < ActionMailer::Base
  default from: 'info@alonablue.com'

  def reservation(record)
    @record = record
    mail(to: 'arebuckley@gmail.com', subject: 'New Reservation for Alona Blue')
  end
end