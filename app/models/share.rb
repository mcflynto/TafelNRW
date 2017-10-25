class Share < ApplicationRecord
  belongs_to :organization
  belongs_to :donation
  validate :amount_validation?
  validate :pickup?

  def amount_validation?
    d = self.donation
    if(self.amount > d.amount)
      errors.add(:amount, "cannot be higher then total amount")
    end
    if d.shares.sum(:amount) + self.amount > d.amount
      errors.add(:amount, "cannot be higher then total amount")
    end
    if self.amount <= 0
      errors.add(:amount, "cannot be 0")
    end
  end

  def pickup?
    d = self.donation
    if(self.pick_up_date > d.expiry_date)
      errors.add(:pick_up_date, "You cannot pick it up after the donation is expired")
    end
  end

end
