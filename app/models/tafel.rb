class Tafel < ApplicationRecord
  belongs_to :address
  has_and_belongs_to_many :transporters
  has_and_belongs_to_many :donations
end
