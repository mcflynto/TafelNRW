class DonatorMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def pickup_email(donation, organization, donator, share)
    @donation = donation
    @organization = organization
    @donator = donator
    @share = share
    mail(to: @donator.email, subject: 'Spende wird selbst abgeholt')
  end

  def transport_confirmed_mail(donation)
    @donation = donation
    @donator = @donation.donator
    @transporter = @donation.transporter
    @shares_amount = @donation.shares.sum(:amount)
    @shares = @donation.shares

    mail(to: @donator.email, subject: 'Transport bestätigt')
  end
end
