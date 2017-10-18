class Donator < ApplicationRecord
  has_one :adress
  has_many :donations
end
