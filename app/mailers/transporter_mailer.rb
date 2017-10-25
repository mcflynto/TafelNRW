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

  def transport_confirmed_mail(donation)
    @donation = donation
    @donator = @donation.donator
    @transporter = @donation.transporter
    @shares = @donation.shares

    mail(to: @transporter.email, subject: 'Transport bestätigt')
  end
end
