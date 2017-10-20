class Tafel < ApplicationRecord
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
  has_and_belongs_to_many :donations
end
