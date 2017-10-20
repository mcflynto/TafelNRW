class Transporter < ApplicationRecord
  has_many :donations
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
end
