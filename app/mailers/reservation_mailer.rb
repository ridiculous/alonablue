class ReservationMailer < ActionMailer::Base
  default from: 'info@alonablue.com'

  def reservation(record)
    @record = record
    recipients = ['Ryan <arebuckley@gmail.com>']
    recipients << 'Mike Jeffreys <boholblue@gmail.com>' if Rails.env.production?
    mail(to: recipients, subject: 'New Reservation for Alona Blue')
  end
end