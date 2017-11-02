# Sends mails to organizations and donators for a new donation
class DonationMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def donation_email(donation, organization, donator)
    @donation = donation
    @organization = organization
    @donator = donator
    @url = donation_url(@donation)
    mail(to: @organization.email, subject: 'Neue Spende')
  end

  def donation_email_donator(donator, donation)
    @donation = donation
    @donator = donator
    @url = show_donator_donation_url(@donation)
    mail(to: @donator.email, subject: 'Deine Spende')
  end
end
