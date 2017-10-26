# Transporter Mailer
class TransporterMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def transporter_email(donation, donator, transporter)
    @donation = donation
    @shares = @donation.shares.where(pick_up: false)
    @donator = donator
    @transporter = transporter
    @url = transport_donation_url(@donation, transporter_hash: @transporter.transporter_hash)

    mail(to: @transporter.email, subject: 'Transport angefordert')
  end

  def transport_confirmed_mail(donation)
    @donation = donation
    @donator = @donation.donator
    @transporter = @donation.transporter
    @shares = @donation.shares.where(pick_up: false)

    mail(to: @transporter.email, subject: 'Transport bestätigt')
  end
end
