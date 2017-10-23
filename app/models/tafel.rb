class Tafel < ApplicationRecord
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
  has_many :tafels, through: :donation_tafels
end
