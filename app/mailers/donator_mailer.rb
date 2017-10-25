class DonatorMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def pickup_email(donation, organization, donator, share)
    @donation = donation
    @organization = organization
    @donator = donator
    @share = share
    mail(to: @donator.email, subject: 'Spende wird selbst abgeholt')
  end
end
