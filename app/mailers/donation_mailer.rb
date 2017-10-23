class DonationMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def donation_email(donation, tafel, donator)
    @donation = donation
    @tafel = tafel
    @donator = donator
    @url = "http://0.0.0.0:3000/donations/#{@donation.id}"
    mail(to: @tafel.email , subject: "Neue Spende")
  end

  def donation_email_donator(donator, donation)
    @donation = donation
    @donator = donator
    @url = "http://0.0.0.0:3000/donations/#{@donation.id}"
    mail(to: @donator.email, subject: "Deine Spende")
  end
end
