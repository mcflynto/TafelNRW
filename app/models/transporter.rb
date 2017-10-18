class Transporter < ApplicationRecord
  has_many :donations
  has_and_belongs_to_many :tafels
  has_one :adress
end
