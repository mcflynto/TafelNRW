
class DonationEmailService
  def initialize(donation, donator)
    @donation = donation
    @donator = donator
  end

  def send_donation_email
    @donation.donation_mail(@donator)
    DonationMailer.donation_email_donator(@donator, @donation).deliver_later
  end


end
