class Donation < ApplicationRecord
  belongs_to :donator, optional: true
  belongs_to :transporter, optional: true
  has_many :organizations, through: :shares
  has_many :shares

  validates_presence_of :food, :amount, :unit, :expiry_date
  validates :amount,  numericality: { greater_than: 0 }

  def donation_mail(donator)
    @organization = Organization.all
    @organization.each do |t|
      DonationMailer.donation_email(self, t, donator).deliver_now
    end
  end

end
