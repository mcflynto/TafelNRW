class Tafel < ApplicationRecord
  has_one :adress
  has_and_belongs_to_many :transpoters
  has_and_belongs_to_many :donations
end
