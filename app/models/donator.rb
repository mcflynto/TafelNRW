class Donator < ApplicationRecord
  has_one :address, as: :addressable
  has_many :donations
end
