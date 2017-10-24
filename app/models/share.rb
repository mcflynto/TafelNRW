class Share < ApplicationRecord
  belongs_to :organization
  belongs_to :donation
  validate :amount_validation?

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

end
