class Donation < ApplicationRecord
  belongs_to :donator, optional: true
  belongs_to :transporter, optional: true
  has_many :organizations, through: :shares
  has_many :shares

  validates_presence_of :food, :amount, :unit
  validates :amount,  numericality: { greater_than: 0 }

  def donation_mail(donator)
    @organization = Organization.all
    @organization.each do |t|
      DonationMailer.donation_email(self, t, donator).deliver_now
    end
  end

  def change_amount(amount)
    pre_ordered_amount = self.ordered_amount + amount
    self.update(ordered_amount: pre_ordered_amount)
  end

  def update_amount(old_amount, new_amount)
    amount = old_amount - new_amount
    pre_ordered_amount = self.ordered_amount - amount

    self.update(ordered_amount: pre_ordered_amount)
  end
end
