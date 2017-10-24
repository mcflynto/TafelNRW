# Transporter Mailer
class TransporterMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def transporter_email(donation, donator, transporter)
    @donation = donation
    @shares = @donation.shares
    @donator = donator
    @transporter = transporter
    @url = "http://0.0.0.0:3000/donations/#{@donation.id}/transport"
    mail(to: @transporter.email, subject: 'Transport angefordert')
  end
end
