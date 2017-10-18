class Donator < ApplicationRecord
  belongs_to :address
  has_many :donations
end
