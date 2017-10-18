class Tafel < ApplicationRecord
  has_one :address, as: :addressable
  has_and_belongs_to_many :transporters
  has_and_belongs_to_many :donations
end
