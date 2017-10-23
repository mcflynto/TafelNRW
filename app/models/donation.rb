class Donation < ApplicationRecord
  belongs_to :donator, optional: true
  belongs_to :transporter, optional: true
  has_many :tafels, through: :donation_tafels

  def donation_mail(donator)
    @tafel = Tafel.all
    @tafel.each do |t|
      DonationMailer.donation_email(self, t, donator).deliver_now
    end
  end
end
