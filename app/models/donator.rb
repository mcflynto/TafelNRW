# Donator model
class Donator < ApplicationRecord
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
  has_many :donations
  accepts_nested_attributes_for :donations
end
