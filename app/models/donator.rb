# Donator model
class Donator < ApplicationRecord
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
  has_many :donations

  validates_presence_of :name, :email
  validates :email, uniqueness: true

  def open_donation
    @open = self.donations.where(ordered: nil).all
    @open.where('expiry_date > ?', DateTime.now)
  end

  def ordered_donation
    self.donations.where(ordered: true).all
  end
end
