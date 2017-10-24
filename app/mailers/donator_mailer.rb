class DonatorMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def pickup_email(donator, organization, donator)
    @donator = donator
    @organization = organization
    @donator = donator
    mail(to: @donator.email, subject: 'Spende wird selbst abgeholt')
  end
end
